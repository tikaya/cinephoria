import pg from 'pg';
import dotenv from 'dotenv';
dotenv.config({ path: './.env' }); // ou '../.env' selon l’endroit

const pool = new pg.Pool({
  user: String(process.env.DB_USER || ''),
  host: String(process.env.DB_HOST || ''),
  database: String(process.env.DB_NAME || ''),
  password: `${process.env.DB_PASSWORD}`,  // <-- cast explicite
  port: Number(process.env.DB_PORT || 5432),
});

export default pool;
