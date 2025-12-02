import pool from "../config/db.js";

export const findUserByEmail = async (email) => {
  const sql = `
    SELECT id_user, email, password, password_temp
    FROM utilisateur
    WHERE email = $1
  `;
  const result = await pool.query(sql, [email]);
  return result.rows[0];
};

export const updatePassword = async (id_user, hash, temp) => {
  const sql = `
    UPDATE utilisateur
    SET password = $1,
        password_temp = $2
    WHERE id_user = $3;
  `;
  return pool.query(sql, [hash, temp, id_user]);
};
