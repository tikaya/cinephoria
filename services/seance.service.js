// services/seance.service.js
import pool from "../config/db.js";
import * as model from '../models/seance.model.js';
import { fetchFutureSeancesByFilm } from "../models/seance.model.js";

/**
 * Petite vérif d'ID
 */
function assertPositiveInt(id) {
  const n = Number(id);
  if (!Number.isFinite(n) || !Number.isInteger(n) || n <= 0) {
    const e = new Error("ID invalide");
    e.userMessage = "ID invalide : entier positif requis.";
    throw e;
  }
  return n;
}

// =============================================
// ✅ LIST - Pagination + Filtres (pour admin)
// =============================================
export async function list({ page = 1, film = '', salle = '', date = '' } = {}) {
  const pageSize = 20;
  const offset = (page - 1) * pageSize;

  let where = 'WHERE 1=1';
  const params = [];
  let i = 1;

  if (film) {
    where += ` AND f.titre ILIKE $${i++}`;
    params.push(`%${film}%`);
  }
  if (salle) {
    where += ` AND s.nom_salle ILIKE $${i++}`;
    params.push(`%${salle}%`);
  }
  if (date) {
    where += ` AND se.date_seance = $${i++}`;
    params.push(date);
  }

  // Total count
  const countRes = await pool.query(`
    SELECT COUNT(*) AS total
    FROM seance se
    JOIN film f ON f.id_film = se.id_film
    JOIN salle s ON s.id_salle = se.id_salle
    ${where}
  `, params);

  const total = parseInt(countRes.rows[0].total, 10);

  // Rows
  const rowsRes = await pool.query(`
    SELECT 
      se.id_seance,
      se.date_seance,
      se.heure_debut,
      se.heure_fin,
      se.prix,
      se.qualite_projection,
      f.id_film,
      f.titre AS film_titre,
      s.id_salle,
      s.nom_salle,
      c.id_cinema,
      c.nom_cinema
    FROM seance se
    JOIN film f ON f.id_film = se.id_film
    JOIN salle s ON s.id_salle = se.id_salle
    JOIN cinema c ON c.id_cinema = s.id_cinema
    ${where}
    ORDER BY se.date_seance DESC, se.heure_debut DESC
    LIMIT $${i++} OFFSET $${i++}
  `, [...params, pageSize, offset]);

  // Films et salles pour les filtres
  const filmsRes = await pool.query(`SELECT id_film, titre FROM film ORDER BY titre`);
  const sallesRes = await pool.query(`SELECT id_salle, nom_salle FROM salle ORDER BY nom_salle`);

  return {
    rows: rowsRes.rows,
    total,
    pageSize,
    films: filmsRes.rows,
    salles: sallesRes.rows
  };
}

// =============================================
// ✅ GET BY ID
// =============================================
export async function getById(id) {
  const seanceId = assertPositiveInt(id);
  
  const res = await pool.query(`
    SELECT 
      se.*,
      f.titre AS film_titre,
      s.nom_salle,
      s.id_cinema
    FROM seance se
    JOIN film f ON f.id_film = se.id_film
    JOIN salle s ON s.id_salle = se.id_salle
    WHERE se.id_seance = $1
  `, [seanceId]);

  return res.rows[0] || null;
}

// =============================================
// ✅ GET FORM DATA (films + salles pour select)
// =============================================
export async function getFormData() {
  const filmsRes = await pool.query(`SELECT id_film, titre FROM film ORDER BY titre`);
  const sallesRes = await pool.query(`
    SELECT s.id_salle, s.nom_salle, s.id_cinema, c.nom_cinema
    FROM salle s
    JOIN cinema c ON c.id_cinema = s.id_cinema
    ORDER BY c.nom_cinema, s.nom_salle
  `);

  return {
    films: filmsRes.rows,
    salles: sallesRes.rows
  };
}

// =============================================
// ✅ CREATE
// =============================================
export async function create(data) {
  const { id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection } = data;

  // Validation basique
  if (!id_film || !id_salle || !date_seance || !heure_debut) {
    const e = new Error("Champs obligatoires manquants");
    e.expose = [{ field: '_', message: "Film, salle, date et heure de début sont requis" }];
    throw e;
  }

  const res = await pool.query(`
    INSERT INTO seance (id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id_seance
  `, [id_film, id_salle, date_seance, heure_debut, heure_fin || null, prix || null, qualite_projection || null]);

  return res.rows[0];
}

// =============================================
// ✅ UPDATE
// =============================================
export async function update(id, data) {
  const seanceId = assertPositiveInt(id);
  const { id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection } = data;

  if (!id_film || !id_salle || !date_seance || !heure_debut) {
    const e = new Error("Champs obligatoires manquants");
    e.expose = [{ field: '_', message: "Film, salle, date et heure de début sont requis" }];
    throw e;
  }

  await pool.query(`
    UPDATE seance
    SET id_film = $1,
        id_salle = $2,
        date_seance = $3,
        heure_debut = $4,
        heure_fin = $5,
        prix = $6,
        qualite_projection = $7
    WHERE id_seance = $8
  `, [id_film, id_salle, date_seance, heure_debut, heure_fin || null, prix || null, qualite_projection || null, seanceId]);

  return { id_seance: seanceId };
}

// =============================================
// ✅ REMOVE
// =============================================
export async function remove(id) {
  const seanceId = assertPositiveInt(id);
  
  await pool.query(`DELETE FROM seance WHERE id_seance = $1`, [seanceId]);
  
  return { deleted: true };
}

// =============================================
// ✅ GET FILM DATA (existant)
// =============================================
export async function getFilmData(id) {
  const filmId = assertPositiveInt(id);

  const filmRes = await pool.query(
    `SELECT id_film, titre, description, genre, affiche_url AS poster_url, age_minimum
     FROM film
     WHERE id_film = $1
     LIMIT 1`,
    [filmId]
  );

  const film = filmRes.rows[0];
  if (!film) return null;

  const seances = await fetchFutureSeancesByFilm(filmId);

  return { film, seances };
}