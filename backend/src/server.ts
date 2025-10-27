import express, { Request, Response, NextFunction } from "express";
import cors from "cors";
import helmet from "helmet";
import rateLimit from "express-rate-limit";
import { Pool } from "pg";
import dotenv from "dotenv";
import multer from "multer";
import {
  BlobSASPermissions,
  BlobServiceClient,
  generateBlobSASQueryParameters,
  StorageSharedKeyCredential,
} from "@azure/storage-blob";
import { checkAndInitialize } from "./db-init";
import {
  register,
  metricsMiddleware,
  monitorDatabasePool,
  trackDbQuery,
  petsCreatedTotal,
  reportsCreatedTotal,
  spatialQueryDuration,
  spatialQueryResultCount,
  podHealthStatus,
  rateLimitHits,
  trackBlobUpload,
} from "./metrics";

dotenv.config();
const app = express();

// env variables processing
const PORT = process.env.PORT || 3001;
const FILE_SIZE_LIMIT_MB = Number(process.env.FILE_SIZE_LIMIT_MB) || 10;
// Azure Blob Storage setup
const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.AZURE_STORAGE_CONNECTION_STRING || ""
);
const containerName = process.env.AZURE_STORAGE_CONTAINER || "images";

// Database connection pool
const pool = new Pool({
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT || "5432"),
  database: process.env.DB_NAME,
  // user: `${process.env.DB_USER}@${process.env.DB_SERVER}`,
  user: `${process.env.DB_USER}`,
  password: process.env.DB_PASSWORD,
  ssl: {
    rejectUnauthorized: false, // Azure requires SSL
  },
  max: 10,
  idleTimeoutMillis: 10000,
  connectionTimeoutMillis: 10000,
  keepAlive: true,
});

// Monitor Pool
monitorDatabasePool(pool);

// Middleware
app.use(helmet());
app.use(
  cors({
    origin: process.env.ALLOWED_ORIGINS?.split(",") || "*",
    credentials: false,
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);
app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ extended: true, limit: "10mb" }));
app.use(metricsMiddleware);

// Rate limiting
const generalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 300,
  message: "Too many requests from this IP, please try again later.",
  standardHeaders: true,
  legacyHeaders: false,
  handler: (_, res) => {
    rateLimitHits.labels("general").inc();
    res.status(429).json({
      error: "Too many requests from this IP, please try again later.",
    });
  },
});

const uploadLimiter = rateLimit({
  windowMs: 60 * 60 * 1000,
  max: 10,
  message: "Too many upload requests, please try again later.",
  handler: (_, res) => {
    rateLimitHits.labels("upload").inc();
    res.status(429).json({
      error: "Too many upload requests, please try again later.",
    });
  },
});

app.use("/api/", generalLimiter);

// Multer configuration for file uploads
const upload = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: FILE_SIZE_LIMIT_MB * 1024 * 1024,
  },
  fileFilter: (_req, file, cb) => {
    const allowedMimes = ["image/jpeg", "image/png", "image/gif", "image/webp"];
    if (allowedMimes.includes(file.mimetype)) {
      cb(null, true);
    } else {
      cb(
        new Error("Invalid file type. Only JPEG, PNG, GIF, and WebP allowed.")
      );
    }
  },
});

// Health check endpoint
app.get("/api/health", async (_req: Request, res: Response) => {
  try {
    await pool.query("SELECT 1");
    podHealthStatus.set(1);
    res.status(200).json({
      status: "healthy",
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    podHealthStatus.set(0);
    res
      .status(503)
      .json({ status: "unhealthy", error: (error as Error).message });
  }
});

app.get("/api/metrics", async (_req: Request, res: Response) => {
  try {
    res.set("Content-Type", register.contentType);
    const metrics = await register.metrics();
    res.end(metrics);
  } catch (error) {
    res.status(500).end(error);
  }
});

// GET all pets
app.get("/api/pets", async (req: Request, res: Response) => {
  try {
    const { minLat, maxLat, minLng, maxLng } = req.query;

    // If bounding box provided, filter by coordinates
    if (minLat && maxLat && minLng && maxLng) {
      const start = Date.now();
      const result = await trackDbQuery("get_pets_spatial", () =>
        pool.query(
          `
        SELECT * FROM pets
          WHERE ST_Contains(
            ST_MakeEnvelope($1, $2, $3, $4, 4326),
            geom
          )
          ORDER BY "reportDate" DESC
      `,
          [
            parseFloat(minLat as string),
            parseFloat(maxLat as string),
            parseFloat(minLng as string),
            parseFloat(maxLng as string),
          ]
        )
      );
      const duration = (Date.now() - start) / 1000;
      spatialQueryDuration.labels("pets_bbox").observe(duration);
      spatialQueryResultCount.labels("pets_bbox").observe(result.rows.length);

      console.log("in view:", result.rows.length);
      return res.json(result.rows);
    }

    // Otherwise return all pets
    const result = await trackDbQuery("get_pets_all", () =>
      pool.query('SELECT * FROM pets ORDER BY "reportDate" DESC')
    );
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching pets:", error);
    res.status(500).json({ error: "Failed to fetch pets" });
  }
  return null;
});
// GET map-data (pets and reports!)
app.get("/api/map-data", async (req: Request, res: Response) => {
  try {
    const { minLat, maxLat, minLng, maxLng } = req.query;
    // Check if bounding box is provided
    const hasBounds = minLat && maxLat && minLng && maxLng;
    console.log(hasBounds ? "in-view mode" : "all-pets-mode");
    if (hasBounds) {
      // Use PostGIS spatial query with bounding box
      const start = Date.now();

      const [pets, reports] = await Promise.all([
        trackDbQuery("get_map_pets_spatial", () =>
          pool.query(
            `SELECT * FROM pets
             WHERE ST_Contains(
               ST_MakeEnvelope($1, $2, $3, $4, 4326), geom
             )
             ORDER BY "reportDate" DESC`,
            [
              parseFloat(minLng as string),
              parseFloat(minLat as string),
              parseFloat(maxLng as string),
              parseFloat(maxLat as string),
            ]
          )
        ),
        trackDbQuery("get_map_reports_spatial", () =>
          pool.query(
            `SELECT * FROM reports
             WHERE ST_Contains(
               ST_MakeEnvelope($1, $2, $3, $4, 4326), geom
             )
             ORDER BY "created_at" DESC`,
            [
              parseFloat(minLng as string),
              parseFloat(minLat as string),
              parseFloat(maxLng as string),
              parseFloat(maxLat as string),
            ]
          )
        ),
      ]);

      const duration = (Date.now() - start) / 1000;
      spatialQueryDuration.labels("map_data_bbox").observe(duration);
      spatialQueryResultCount.labels("pets_bbox").observe(pets.rows.length);
      spatialQueryResultCount
        .labels("reports_bbox")
        .observe(reports.rows.length);

      console.log(
        `in view: Pets (${pets.rows.length}) - Reports (${reports.rows.length})`
      );
      return res.json({ pets: pets.rows, reports: reports.rows });
    } else {
      // Return all pets and reports (no spatial filter)
      const [pets, reports] = await Promise.all([
        trackDbQuery("get_map_pets_all", () =>
          pool.query('SELECT * FROM pets ORDER BY "reportDate" DESC')
        ),
        trackDbQuery("get_map_reports_all", () =>
          pool.query('SELECT * FROM reports ORDER BY "created_at" DESC')
        ),
      ]);

      console.log(
        `all: Pets (${pets.rows.length}) - Reports (${reports.rows.length})`
      );
      return res.json({ pets: pets.rows, reports: reports.rows });
    }
  } catch (error) {
    console.error("Error fetching map data:", error);
    return res.status(500).json({ error: "Failed to fetch map data" });
  }
});

// GET single pet by caseId
app.get("/api/pets/:caseId", async (req: Request, res: Response) => {
  try {
    const { caseId } = req.params;
    const result = await trackDbQuery("get_pet_by_id", () =>
      pool.query('SELECT * FROM pets WHERE "caseId" = $1', [caseId])
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Pet not found" });
    }

    res.json(result.rows[0]);
  } catch (error) {
    console.error("Error fetching pet:", error);
    return res.status(500).json({ error: "Failed to fetch pet" });
  }
  return null;
});

// POST new pet
app.post("/api/pets", async (req: Request, res: Response) => {
  const client = await pool.connect();

  try {
    const {
      name,
      petType,
      contact,
      isLost,
      caseStatus,
      position__latitude,
      position__longitude,
      imageUrl,
      description,
      message,
      reporterName,
      reward,
      breed,
      tags,
      language,
      reportDate,
      microchip__hasMicrochip,
      microchip__microchipNumber,
    } = req.body;

    const result = await trackDbQuery("create_pet", () =>
      client.query(
        `INSERT INTO pets (
        name, "petType", contact, "isLost", "caseStatus",
        "position__latitude", "position__longitude", "imageUrl",
        description, message, "reporterName", reward, breed,
        tags, language, "reportDate", "microchip__hasMicrochip",
        "microchip__microchipNumber"
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18)
      RETURNING *`,
        [
          name,
          petType,
          contact,
          isLost,
          caseStatus,
          position__latitude,
          position__longitude,
          imageUrl,
          description,
          message,
          reporterName,
          reward,
          breed,
          tags,
          language,
          reportDate || new Date(),
          microchip__hasMicrochip,
          microchip__microchipNumber,
        ]
      )
    );
    petsCreatedTotal
      .labels(petType || "unknown", isLost ? "true" : "false")
      .inc();

    res.json(result.rows[0]);
  } catch (error) {
    console.error("Error creating pet:", error);
    res.status(500).json({ error: "Failed to create pet entry" });
  } finally {
    client.release();
  }
});

// GET all reports
app.get("/api/reports", async (req: Request, res: Response) => {
  try {
    const { minLat, maxLat, minLng, maxLng } = req.query;

    // If bounding box provided, filter by coordinates
    if (minLat && maxLat && minLng && maxLng) {
      const start = Date.now();

      const result = await trackDbQuery("get_reports_spatial", () =>
        pool.query(
          `SELECT * FROM reports
           WHERE ST_Contains(
             ST_MakeEnvelope($1, $2, $3, $4, 4326), geom
           )
           ORDER BY "created_at" DESC`,
          [
            parseFloat(minLat as string),
            parseFloat(maxLat as string),
            parseFloat(minLng as string),
            parseFloat(maxLng as string),
          ]
        )
      );
      const duration = (Date.now() - start) / 1000;
      spatialQueryDuration.labels("reports_bbox").observe(duration);
      spatialQueryResultCount
        .labels("reports_bbox")
        .observe(result.rows.length);

      console.log("reports in view:", result.rows.length);
      return res.json(result.rows);
    }

    // Otherwise return all reports
    const result = await trackDbQuery("get_reports_all", () =>
      pool.query('SELECT * FROM reports ORDER BY "created_at" DESC')
    );
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching reports:", error);
    res.status(500).json({ error: "Failed to fetch reports" });
  }
  return null;
});

// GET reports for a specific case
app.get("/api/reports/case/:caseId", async (req: Request, res: Response) => {
  try {
    const { caseId } = req.params;
    const result = await trackDbQuery("get_reports_by_case", () =>
      pool.query(
        'SELECT * FROM reports WHERE "caseId" = $1 ORDER BY "created_at" DESC',
        [caseId]
      )
    );

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching reports:", error);
    res.status(500).json({ error: "Failed to fetch reports" });
  }
});

// POST new report
app.post("/api/reports", async (req: Request, res: Response) => {
  const client = await pool.connect();

  try {
    const {
      caseId,
      name,
      contact,
      reportLatitude,
      reportLongitude,
      isPetFoundReport,
      language,
      isCaseReviewed,
      imageUrl,
      message,
      petType,
    } = req.body;

    // Validate message length (enforced by DB constraint as well)
    if (message && message.length >= 200) {
      return res
        .status(400)
        .json({ error: "Message must be less than 200 characters" });
    }

    const result = await trackDbQuery("create_report", () =>
      client.query(
        `INSERT INTO reports (
          "caseId", name, contact, "reportLatitude", "reportLongitude",
          "isPetFoundReport", language, "isCaseReviewed", "imageUrl",
          message, "petType"
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
        RETURNING *`,
        [
          caseId,
          name,
          contact,
          reportLatitude,
          reportLongitude,
          isPetFoundReport,
          language,
          isCaseReviewed || false,
          imageUrl,
          message,
          petType,
        ]
      )
    );
    reportsCreatedTotal
      .labels(petType || "unknown", isPetFoundReport ? "true" : "false")
      .inc();

    res.json(result.rows[0]);
  } catch (error) {
    console.error("Error creating report:", error);
    return res.status(500).json({ error: "Failed to create report" });
  } finally {
    client.release();
  }
  return null;
});

// POST upload image to Azure Blob Storage
app.post(
  "/api/upload",
  uploadLimiter,
  upload.single("file"),
  async (req: Request, res: Response) => {
    try {
      if (!req.file) {
        return res.status(400).json({ error: "No file uploaded" });
      }

      const file = req.file;
      const blobName = `${Date.now()}-${file.originalname}`;
      const containerClient =
        blobServiceClient.getContainerClient(containerName);

      // Create container if it doesn't exist
      // Need to allow public access on storage account in Terraform
      // --allow-blob-public-access true
      const publicUrl = await trackBlobUpload(async () => {
        await containerClient.createIfNotExists({
          access: "blob",
        });

        const blockBlobClient = containerClient.getBlockBlobClient(blobName);

        await blockBlobClient.upload(file.buffer, file.size, {
          blobHTTPHeaders: {
            blobContentType: file.mimetype,
            blobCacheControl: "public, max-age=3600",
          },
        });

        const sasToken = generateBlobSASQueryParameters(
          {
            containerName,
            blobName,
            permissions: BlobSASPermissions.parse("r"),
            startsOn: new Date(),
            expiresOn: new Date(
              new Date().valueOf() + 365 * 24 * 60 * 60 * 1000
            ),
          },
          new StorageSharedKeyCredential(
            process.env.AZURE_STORAGE_ACCOUNT_NAME!,
            process.env.AZURE_STORAGE_ACCOUNT_KEY!
          )
        ).toString();

        return `${blockBlobClient.url}?${sasToken}`;
      }, file.size);

      return res.status(200).json({ url: publicUrl });
    } catch (error) {
      console.error("Error uploading file:", error);
      return res.status(500).json({ error: "Failed to upload file" });
    }
  }
);

// Error handling middleware
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error("Unhandled error:", err);
  res.status(500).json({ error: "Internal server error" });
});

// 404 handler
app.use((_req: Request, res: Response) => {
  res.status(404).json({ error: "Route not found" });
});

// Start server
async function startServer() {
  try {
    // Initialize database if needed
    await checkAndInitialize(pool);

    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
      console.log(`Environment: ${process.env.NODE_ENV || "development"}`);
    });
  } catch (error) {
    console.error("Failed to start server:", error);
    process.exit(1);
  }
}

startServer();

// Graceful shutdown
process.on("SIGTERM", async () => {
  console.log("SIGTERM signal received: closing HTTP server");
  await pool.end();
  process.exit(0);
});

process.on("SIGINT", async () => {
  console.log("SIGINT signal received: closing HTTP server");
  await pool.end();
  process.exit(0);
});
