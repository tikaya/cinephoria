// models/employe.model.js
import pool from "../config/db.js";

// Aucune validation/normalisation ici → on reçoit des valeurs déjà prêtes.
export async function insertOne({ email, passwordHash, role }) {
  const sql = `
    INSERT INTO employe (email_employe, password_hash, role_employe)
    VALUES ($1, $2, $3)
    RETURNING id_employe
  `;
  const { rows } = await pool.query(sql, [email, passwordHash, role]);
  return rows[0].id_employe;
}

export async function findByEmail(email) {
  const { rows } = await pool.query(
    `SELECT * FROM employe WHERE email_employe = $1 LIMIT 1`,
    [email]
  );
  return rows[0] || null;
}

// Optionnel : existence (si tu veux le faire côté service)
export async function emailExists(email) {
  const { rows } = await pool.query(
    `SELECT 1 FROM employe WHERE email_employe = $1 LIMIT 1`,
    [email]
  );
  return rows.length > 0;
}

const T = 'employe';
export async function listPage({ limit = 20, offset = 0, q = null, role = null } = {}) {
  const where = [];
  const args = [];
  let i = 1;

  if (q)   { where.push('LOWER(email_employe) LIKE $' + i); args.push(`%${q}%`); i++; }
  if (role){ where.push('role_employe = $' + i); args.push(role); i++; }

  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';
  const sql = `
    SELECT id_employe, email_employe, role_employe, created_at
    FROM ${T}
    ${whereSql}
    ORDER BY id_employe DESC
    LIMIT $${i} OFFSET $${i+1}
  `;
  args.push(limit, offset);

  const { rows } = await pool.query(sql, args);
  return rows;
}

export async function countAll({ q = null, role = null } = {}) {
  const where = [];
  const args = [];
  let i = 1;

  if (q)   { where.push('LOWER(email_employe) LIKE $' + i); args.push(`%${q}%`); i++; }
  if (role){ where.push('role_employe = $' + i); args.push(role); i++; }

  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';
  const { rows } = await pool.query(`SELECT COUNT(*)::int AS n FROM ${T} ${whereSql}`, args);
  return rows[0]?.n ?? 0;
}