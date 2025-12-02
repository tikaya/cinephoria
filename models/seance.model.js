// models/seance.model.js
import pool from "../config/db.js";

/** Liste + jointures film/salle */
export async function findAllSeances() {
  const sql = `
    SELECT
      s.id_seance, s.date_seance, s.heure_debut, s.heure_fin, s.prix,
      s.id_film, s.id_salle, s.qualite_projection,
      f.titre AS film_titre,
      f.affiche_url AS poster_url, 
      sa.nom_salle
    FROM seance s
    JOIN film  f  ON f.id_film  = s.id_film
    JOIN salle sa ON sa.id_salle = s.id_salle
    ORDER BY s.date_seance, s.heure_debut;
  `;
  const { rows } = await pool.query(sql);
  return rows;
}

/** Lecture d’une séance */
export async function findSeanceById(id) {
  const sql = `
    SELECT
      s.*, f.titre AS film_titre,  f.affiche_url AS poster_url, sa.nom_salle, sa.id_cinema
    FROM seance s
    JOIN film  f  ON f.id_film  = s.id_film
    JOIN salle sa ON sa.id_salle = s.id_salle
    WHERE s.id_seance = $1
    LIMIT 1;
  `;
  const { rows } = await pool.query(sql, [id]);
  return rows[0] || null;
}

/** Création */
export async function insertSeanceRow({
  date_seance, heure_debut, heure_fin, prix, id_film, id_salle, qualite_projection
}) {
  const sql = `
    INSERT INTO seance (date_seance, heure_debut, heure_fin, prix, id_film, id_salle, qualite_projection)
    VALUES ($1,$2,$3,$4,$5,$6,$7)
    RETURNING id_seance;
  `;
  const vals = [date_seance, heure_debut, heure_fin, prix, id_film, id_salle, qualite_projection];
  const { rows } = await pool.query(sql, vals);
  return rows[0]?.id_seance ?? null;
}

/** Mise à jour */
export async function updateSeanceRow(id, {
  date_seance, heure_debut, heure_fin, prix, id_film, id_salle, qualite_projection
}) {
  const sql = `
    UPDATE seance
       SET date_seance=$1, heure_debut=$2, heure_fin=$3,
           prix=$4, id_film=$5, id_salle=$6, qualite_projection=$7
     WHERE id_seance=$8
     RETURNING id_seance;
  `;
  const vals = [date_seance, heure_debut, heure_fin, prix, id_film, id_salle, qualite_projection, id];
  const { rows } = await pool.query(sql, vals);
  return rows[0]?.id_seance ?? null;
}

/** Suppression */
export async function deleteSeanceRow(id) {
  const sql = `DELETE FROM seance WHERE id_seance=$1 RETURNING id_seance;`;
  const { rows } = await pool.query(sql, [id]);
  return rows[0]?.id_seance ?? null;
}

/** Détection de chevauchement pour une salle/date données */
export async function existsOverlap({ id_salle, date_seance, heure_debut, heure_fin, exclude_id = null }) {
  const sql = `
    SELECT 1
      FROM seance s
     WHERE s.id_salle = $1
       AND s.date_seance = $2
       AND (s.heure_debut < $4 AND s.heure_fin > $3)
       ${exclude_id ? "AND s.id_seance <> $5" : ""}
     LIMIT 1;
  `;
  const params = exclude_id
    ? [id_salle, date_seance, heure_debut, heure_fin, exclude_id]
    : [id_salle, date_seance, heure_debut, heure_fin];

  const { rows } = await pool.query(sql, params);
  return rows.length > 0;
}

export async function findSeancesByFilmId(filmId) {
  const sql = `
    SELECT 
      s.id_seance, s.date_seance, s.heure_debut, s.heure_fin, s.prix,
      s.qualite_projection AS seance_qualite,
      sa.id_salle, sa.nom_salle, sa.qualite_projection AS salle_qualite
    FROM seance s
    JOIN salle sa ON sa.id_salle = s.id_salle
    WHERE s.id_film = $1
      AND s.date_seance >= CURRENT_DATE
    ORDER BY s.date_seance, s.heure_debut;
  `;
  const { rows } = await pool.query(sql, [filmId]);
  return rows;
}

export async function insert({ id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection }) {
  const sql = `
    INSERT INTO seance (id_salle, id_film, date_seance, heure_debut, heure_fin, prix, qualite_projection)
    VALUES ($1,$2,$3,$4,$5,$6,$7)
    RETURNING id_seance
  `;
  const { rows } = await pool.query(sql, [id_salle, id_film, date_seance, heure_debut, heure_fin, prix, qualite_projection]);
  return rows[0].id_seance;
}

export async function findById(id) {
  const nid = Number(id);
  if (!Number.isInteger(nid)) return null;
  const { rows } = await pool.query(`
    SELECT s.id_seance, s.date_seance, s.heure_debut, f.affiche_url AS poster_url,  s.heure_fin, s.prix, s.qualite_projection,
           s.id_film, f.titre AS film_titre,
           s.id_salle, sa.nom_salle
    FROM seance s
    JOIN film f ON f.id_film = s.id_film
    JOIN salle sa ON sa.id_salle = s.id_salle
    WHERE s.id_seance = $1
    LIMIT 1
  `, [nid]);
  return rows[0] || null;
}

/** Chevauchement : même salle & date, créneau qui intersecte */
export async function hasOverlap({ id_salle, date_seance, heure_debut, heure_fin, excludeId }) {
  const params = [id_salle, date_seance, heure_debut, heure_fin];
  let sql = `
    SELECT 1
    FROM seance
    WHERE id_salle = $1
      AND date_seance = $2
      AND NOT ($4 <= heure_debut OR $3 >= heure_fin)
  `;
  if (excludeId) { sql += ` AND id_seance <> $5`; params.push(excludeId); }
  const { rows } = await pool.query(sql, params);
  return rows.length > 0;
}

export async function update(id, { id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection }) {
  const sql = `
    UPDATE seance SET
      id_salle=$1, id_film=$2, date_seance=$3, heure_debut=$4, heure_fin=$5, prix=$6, qualite_projection=$7
    WHERE id_seance=$8
  `;
  await pool.query(sql, [id_salle, id_film, date_seance, heure_debut, heure_fin, prix, qualite_projection, id]);
}

export async function remove(id) {
  await pool.query('DELETE FROM seance WHERE id_seance=$1', [id]);
}

export async function list({ limit = 12, offset = 0, filters = {} }) {
  const where = [];
  const params = [];
  let i = 1;

  if (filters.film) { where.push(`LOWER(f.titre) LIKE $${i++}`); params.push(`%${filters.film.toLowerCase()}%`); }
  if (filters.salle) { where.push(`LOWER(sa.nom_salle) LIKE $${i++}`); params.push(`%${filters.salle.toLowerCase()}%`); }
  if (filters.date) { where.push(`s.date_seance = $${i++}`); params.push(filters.date); }

  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const { rows } = await pool.query(`
    SELECT s.id_seance, s.date_seance, s.heure_debut, s.heure_fin, s.prix, s.qualite_projection,
           f.id_film, f.titre AS film_titre, f.affiche_url AS poster_url, 
           sa.id_salle, sa.nom_salle
    FROM seance s
    JOIN film f ON f.id_film = s.id_film
    JOIN salle sa ON sa.id_salle = s.id_salle
    ${whereSql}
    ORDER BY s.date_seance DESC, s.heure_debut ASC, s.id_seance DESC
    LIMIT ${limit} OFFSET ${offset}
  `, params);
  return rows;
}

export async function count({ filters = {} }) {
  const where = [];
  const params = [];
  let i = 1;

  if (filters.film) { where.push(`LOWER(f.titre) LIKE $${i++}`); params.push(`%${filters.film.toLowerCase()}%`); }
  if (filters.salle) { where.push(`LOWER(sa.nom_salle) LIKE $${i++}`); params.push(`%${filters.salle.toLowerCase()}%`); }
  if (filters.date) { where.push(`s.date_seance = $${i++}`); params.push(filters.date); }

  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const { rows } = await pool.query(`
    SELECT COUNT(*)::int AS c
    FROM seance s
    JOIN film f ON f.id_film = s.id_film
    JOIN salle sa ON sa.id_salle = s.id_salle
    ${whereSql}
  `, params);
  return rows[0].c;
}

/* Pour formulaires & filtres */
export async function fetchFilms() {
  const { rows } = await pool.query(`SELECT id_film, titre FROM film ORDER BY lower(titre) ASC`);
  return rows;
}
export async function fetchSalles() {
  const { rows } = await pool.query(`SELECT id_salle, nom_salle, id_cinema  FROM salle ORDER BY lower(nom_salle) ASC `);
  return rows;
}
export async function fetchFilmsForFilter() { return fetchFilms(); }
export async function fetchSallesForFilter() { return fetchSalles(); }


export async function fetchFutureSeancesByFilm(filmId) {
  const query = `
    SELECT
        s.id_seance,
        s.date_seance,
        s.heure_debut,
        s.heure_fin,
        s.prix,
        s.qualite_projection,
        sa.id_salle,
        sa.nom_salle,
        sa.capacite,
        c.nom_cinema,
        c.ville,
        (sa.capacite - COALESCE(SUM(r.nombre_places), 0)) AS places_restantes
    FROM seance s
    JOIN salle sa ON sa.id_salle = s.id_salle
    JOIN cinema c ON sa.id_cinema = c.id_cinema
    LEFT JOIN reservation r 
      ON r.id_seance = s.id_seance 
      AND r.etat = 'CONFIRMEE'
    WHERE s.id_film = $1
      AND (
            (s.date_seance = CURRENT_DATE AND s.heure_fin > NOW()::time)
         OR s.date_seance > CURRENT_DATE
      )
    GROUP BY s.id_seance, sa.id_salle, sa.nom_salle, sa.capacite,
             s.date_seance, s.heure_debut, s.heure_fin, s.prix,
             s.qualite_projection, c.nom_cinema, c.ville
    ORDER BY s.date_seance ASC, s.heure_debut ASC;
  `;
  const { rows } = await pool.query(query, [filmId]);
  return rows;
}
