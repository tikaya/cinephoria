// models/cinema.model.js
import pool from "../config/db.js";

export const getAllCinemas = async () => {
  const result = await pool.query(`
    SELECT id_cinema, nom_cinema 
    FROM Cinema
    ORDER BY nom_cinema;
  `);
  return result.rows;
};
