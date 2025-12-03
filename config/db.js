// config/db.js
import pg from "pg";
import "dotenv/config";

const { Pool } = pg;

// Détermine la config selon l'environnement
let pgConfig;

if (process.env.NODE_ENV === "test") {
  // Mode TEST
  if (!process.env.DATABASE_URL) {
    throw new Error("❌ DATABASE_URL manquant pour l'environnement de test !");
  }
  pgConfig = {
    connectionString: process.env.DATABASE_URL,
  };
} else {
  // Mode DEV / PROD
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

// Création du pool avec la config choisie
const pool = new Pool(pgConfig);

// Exports AU NIVEAU RACINE (pas dans un if)
export { pgConfig };
export default pool;
