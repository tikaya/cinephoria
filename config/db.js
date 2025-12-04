// config/db.js
import pg from "pg";
import "dotenv/config";
const { Pool } = pg;

let pgConfig;

// Si DATABASE_URL existe, l'utiliser (Railway, Heroku, tests, etc.)
if (process.env.DATABASE_URL) {
  pgConfig = {
    connectionString: process.env.DATABASE_URL,
    // Railway utilise SSL en production
    ...(process.env.NODE_ENV === "production" && {
      ssl: { rejectUnauthorized: false }
    })
  };
} else {
  // Sinon, utiliser les variables séparées (dev local)
  const {
    DB_HOST = "localhost",
    DB_PORT = "5432",
    DB_USER = "postgres",
    DB_PASSWORD,
    DB_NAME = "cinephoria",
  } = process.env;
  
  pgConfig = {
    host: DB_HOST,
    port: Number(DB_PORT),
    user: DB_USER,
    database: DB_NAME,
    ...(DB_PASSWORD != null ? { password: DB_PASSWORD } : {}),
  };
}

const pool = new Pool(pgConfig);

export { pgConfig };
export default pool;