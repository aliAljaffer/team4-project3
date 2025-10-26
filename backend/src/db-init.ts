import { Pool } from "pg";
import * as fs from "fs";
import * as path from "path";

export async function checkAndInitialize(pool: Pool): Promise<void> {
  try {
    console.log("Checking database state...");

    // First check if table exists
    const checkTableQuery = `
      SELECT EXISTS (
        SELECT FROM information_schema.tables
        WHERE table_schema = 'public'
        AND table_name = 'pets'
      );
    `;

    const tableResult = await pool.query(checkTableQuery);
    const tableExists = tableResult.rows[0].exists;

    let needsInitialization = !tableExists;

    // If table exists, check if it has any structure
    if (tableExists) {
      const checkColumnsQuery = `
        SELECT COUNT(*) as count
        FROM information_schema.columns
        WHERE table_schema = 'public'
        AND table_name = 'pets';
      `;

      const columnResult = await pool.query(checkColumnsQuery);
      const columnCount = parseInt(columnResult.rows[0].count);

      // If table exists but has no columns, reinitialize
      needsInitialization = columnCount === 0;
      if (columnCount === 0) {
        console.warn(
          "'pets' table exists but has no columns. Will reinitialize."
        );
        needsInitialization = true;
      }
    }

    if (tableExists && !needsInitialization) {
      const rowCountResult = await pool.query(
        `SELECT COUNT(*) as count FROM pets;`
      );
      const rowCount = parseInt(rowCountResult.rows[0].count, 10);

      if (rowCount === 0) {
        console.warn(
          "'pets' table exists but contains no data. Will reinitialize."
        );
        needsInitialization = true;
      }
    }

    if (needsInitialization) {
      console.log("Database needs initialization. Running SQL scripts...");

      const schemaFilePath = path.join(
        __dirname,
        "..",
        "db-data",
        "catus-locatus-schema.sql"
      );
      const dataFilePath = path.join(
        __dirname,
        "..",
        "db-data",
        "catus-locatus-data-idempotent.sql"
      );

      if (!fs.existsSync(schemaFilePath)) {
        throw new Error(`Schema file not found at ${schemaFilePath}`);
      }

      if (!fs.existsSync(dataFilePath)) {
        throw new Error(`Data file not found at ${dataFilePath}`);
      }

      const schemaSQL = fs.readFileSync(schemaFilePath, "utf8");
      const dataSQL = fs.readFileSync(dataFilePath, "utf8");

      await pool.query(schemaSQL);
      await pool.query(dataSQL);

      console.log("Database initialized successfully!");
    } else {
      console.log("Database is properly initialized.");
    }
  } catch (error: any) {
    if (error.code === "42P07" || error.message?.includes("already exists")) {
      console.warn("⚠️ Skipping already existing relation.");
    } else {
      throw error;
    }
  }
}
