// models/login.model.js
import pool from "../config/db.js";

export const getUserByEmail = async (email) => {
const q = `
    SELECT id_user, email, password, role, username, password_temp
    FROM utilisateur
    WHERE lower(email) = lower($1)
  `;
  const { rows } = await pool.query(q, [email]);
  return rows[0] || null;
};

export const getEmployeByEmail = async (email) => {
  const q = `
  SELECT
  id_employe,
  email_employe,
  password_hash,
  role_employe,
  password_temp
FROM employe
WHERE lower(email_employe) = lower($1)
`;
  const { rows } = await pool.query(q, [email]);
  return rows[0] || null;
};
