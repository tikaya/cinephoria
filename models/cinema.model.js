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

export async function findAllCinemas() {
  const { rows } = await pool.query(`
    SELECT id_cinema, nom_cinema, ville, adresse, telephone
    FROM cinema
    ORDER BY LOWER(ville) ASC, LOWER(nom_cinema) ASC
  `);
  return rows;
}

export async function findCinemaById(id) {
  const nid = Number(id);
  if (!Number.isInteger(nid)) return null;
  const { rows } = await pool.query(`
    SELECT id_cinema, nom_cinema, ville, adresse, telephone
    FROM cinema
    WHERE id_cinema = $1
    LIMIT 1
  `, [nid]);
  return rows[0] || null;
}
