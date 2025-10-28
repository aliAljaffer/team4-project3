import promClient from "prom-client";
import { Pool } from "pg";
import { Request, Response, NextFunction } from "express";

// Create a custom registry
export const register = new promClient.Registry();

// Enable default metrics collection (CPU, memory, etc.)
promClient.collectDefaultMetrics({
  register,
  prefix: "nodejs_",
});

// ==================== Custom Metrics ====================

// API Latency - Histogram with percentiles
export const httpRequestDuration = new promClient.Histogram({
  name: "cl_http_request_duration_seconds",
  help: "Duration of HTTP requests in seconds",
  labelNames: ["method", "route", "status_code"],
  buckets: [0.01, 0.05, 0.1, 0.5, 1, 2, 5, 10],
  registers: [register],
});

// request counter
export const httpRequestTotal = new promClient.Counter({
  name: "cl_http_requests_total",
  help: "Total number of HTTP requests",
  labelNames: ["method", "route", "status_code"],
  registers: [register],
});

// Error Rate - Counter for errors
export const httpErrorsTotal = new promClient.Counter({
  name: "cl_http_errors_total",
  help: "Total number of HTTP errors (4xx and 5xx)",
  labelNames: ["method", "route", "status_code", "error_type"],
  registers: [register],
});

// Active requests (Saturation metric)
export const activeRequests = new promClient.Gauge({
  name: "cl_http_requests_active",
  help: "Number of active HTTP requests currently being processed",
  labelNames: ["method", "route"],
  registers: [register],
});

// Database connection pool (Saturation)
export const dbConnectionPoolSize = new promClient.Gauge({
  name: "cl_db_connection_pool_size",
  help: "Current size of database connection pool",
  labelNames: ["state"], // total, idle, waiting
  registers: [register],
});

export const dbConnectionPoolMax = new promClient.Gauge({
  name: "cl_db_connection_pool_max",
  help: "Maximum database connection pool size",
  registers: [register],
});

// Database query duration
export const dbQueryDuration = new promClient.Histogram({
  name: "cl_db_query_duration_seconds",
  help: "Duration of database queries in seconds",
  labelNames: ["operation"],
  buckets: [0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 2, 5],
  registers: [register],
});

// Database query errors
export const dbQueryErrors = new promClient.Counter({
  name: "cl_db_query_errors_total",
  help: "Total number of database query errors",
  labelNames: ["operation", "error_type"],
  registers: [register],
});

// Azure Blob Storage metrics
export const blobUploadDuration = new promClient.Histogram({
  name: "cl_blob_upload_duration_seconds",
  help: "Duration of blob uploads in seconds",
  buckets: [0.1, 0.5, 1, 2, 5, 10, 30],
  registers: [register],
});

export const blobUploadSize = new promClient.Histogram({
  name: "cl_blob_upload_size_bytes",
  help: "Size of uploaded blobs in bytes",
  buckets: [1024, 10240, 102400, 1024000, 10240000], // 1KB to 10MB
  registers: [register],
});

export const blobUploadTotal = new promClient.Counter({
  name: "cl_blob_uploads_total",
  help: "Total number of blob uploads",
  labelNames: ["status"],
  registers: [register],
});

// Business metrics
export const petsCreatedTotal = new promClient.Counter({
  name: "cl_pets_created_total",
  help: "Total number of pets created",
  labelNames: ["pet_type", "is_lost"],
  registers: [register],
});

export const reportsCreatedTotal = new promClient.Counter({
  name: "cl_reports_created_total",
  help: "Total number of reports created",
  labelNames: ["pet_type", "is_pet_found"],
  registers: [register],
});

// Rate limiting metrics
export const rateLimitHits = new promClient.Counter({
  name: "cl_rate_limit_hits_total",
  help: "Total number of rate limit hits",
  labelNames: ["limiter_type"],
  registers: [register],
});

// Memory usage tracking (Saturation)
export const memoryUsageGauge = new promClient.Gauge({
  name: "cl_nodejs_memory_usage_bytes",
  help: "Node.js memory usage by type",
  labelNames: ["type"], // heapUsed, heapTotal, external, rss
  registers: [register],
});

// Pod health check
export const podHealthStatus = new promClient.Gauge({
  name: "cl_pod_health_status",
  help: "Pod health status (1 = healthy, 0 = unhealthy)",
  registers: [register],
});

// Application uptime
export const appUptime = new promClient.Gauge({
  name: "cl_app_uptime_seconds",
  help: "Application uptime in seconds",
  registers: [register],
});

// Spatial query performance
export const spatialQueryDuration = new promClient.Histogram({
  name: "cl_spatial_query_duration_seconds",
  help: "Duration of PostGIS spatial queries",
  labelNames: ["query_type"],
  buckets: [0.01, 0.05, 0.1, 0.5, 1, 2],
  registers: [register],
});

export const spatialQueryResultCount = new promClient.Histogram({
  name: "cl_spatial_query_result_count",
  help: "Number of results returned by spatial queries",
  labelNames: ["query_type"],
  buckets: [0, 10, 50, 100, 500, 1000, 5000],
  registers: [register],
});

// ==================== Background Metrics Collection ====================

// Track memory usage every 10 seconds
setInterval(() => {
  const memUsage = process.memoryUsage();
  memoryUsageGauge.set({ type: "heapUsed" }, memUsage.heapUsed);
  memoryUsageGauge.set({ type: "heapTotal" }, memUsage.heapTotal);
  memoryUsageGauge.set({ type: "external" }, memUsage.external);
  memoryUsageGauge.set({ type: "rss" }, memUsage.rss);
}, 10000);

// Track uptime
setInterval(() => {
  appUptime.set(process.uptime());
}, 5000);

// ==================== Database Pool Monitoring ====================

export function monitorDatabasePool(pool: Pool) {
  setInterval(() => {
    dbConnectionPoolSize.set({ state: "total" }, pool.totalCount);
    dbConnectionPoolSize.set({ state: "idle" }, pool.idleCount);
    dbConnectionPoolSize.set({ state: "waiting" }, pool.waitingCount);
    dbConnectionPoolMax.set(10);
  }, 5000);
}

// ==================== Middleware ====================

export function metricsMiddleware(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const start = Date.now();
  const method = req.method;
  const route = req.route?.path || req.path;

  // Increment active requests
  activeRequests.inc({ method, route });

  res.on("finish", () => {
    const duration = (Date.now() - start) / 1000;
    const statusCode = res.statusCode.toString();

    // Record request duration
    httpRequestDuration.labels(method, route, statusCode).observe(duration);

    // Increment total requests
    httpRequestTotal.labels(method, route, statusCode).inc();

    // Track errors (4xx and 5xx)
    if (res.statusCode >= 400) {
      const errorType = res.statusCode >= 500 ? "server_error" : "client_error";
      httpErrorsTotal.labels(method, route, statusCode, errorType).inc();
    }

    // Decrement active requests
    activeRequests.dec({ method, route });
  });

  next();
}

// ==================== Helper Functions ====================

export async function trackDbQuery<T>(
  operation: string,
  queryFn: () => Promise<T>
): Promise<T> {
  const start = Date.now();
  try {
    const result = await queryFn();
    const duration = (Date.now() - start) / 1000;
    dbQueryDuration.labels(operation).observe(duration);
    return result;
  } catch (error) {
    const duration = (Date.now() - start) / 1000;
    dbQueryDuration.labels(operation).observe(duration);

    const errorType = (error as Error).message.includes("timeout")
      ? "timeout"
      : "query_error";
    dbQueryErrors.labels(operation, errorType).inc();
    throw error;
  }
}

export async function trackBlobUpload<T>(
  uploadFn: () => Promise<T>,
  fileSize: number
): Promise<T> {
  const start = Date.now();
  try {
    const result = await uploadFn();
    const duration = (Date.now() - start) / 1000;

    blobUploadDuration.observe(duration);
    blobUploadSize.observe(fileSize);
    blobUploadTotal.labels("success").inc();
    return result;
  } catch (error) {
    const duration = (Date.now() - start) / 1000;
    blobUploadDuration.observe(duration);
    blobUploadTotal.labels("error").inc();
    throw error;
  }
}
