// config/db.js
import pg from "pg";
import "dotenv/config"; // charge .env en amont

const { Pool } = pg;

const {
  DB_HOST = "localhost",
  DB_PORT = "5432",
  DB_USER = "postgres",
  DB_PASSWORD,                 // peut être undefined
  DB_NAME = "cinephoria",
} = process.env;

export const pgConfig = {
  host: DB_HOST,
  port: Number(DB_PORT),
  user: DB_USER,
  database: DB_NAME,
  ...(DB_PASSWORD != null ? { password: DB_PASSWORD } : {}), // ← n’ajoute password que s’il existe
  // ssl: { rejectUnauthorized: false }, // si besoin en prod
};

const pool = new Pool(pgConfig);
export default pool;
