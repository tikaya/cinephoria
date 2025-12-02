import pool from '../config/db.js';

// Récupérer tous les cinémas
export const getAllCinemas = async () => {
  const query = `SELECT id_cinema, nom_cinema FROM cinema ORDER BY nom_cinema;`;
  const result = await pool.query(query);
  return result.rows;
};

// Récupérer tous les films d'un cinéma
// models/reservation.model.js

export const getFilmsByCinemaId = async (cinemaId) => {
  const query = `
    SELECT DISTINCT
      f.id_film,
      f.titre,
      f.genre,
      f.affiche_url AS poster_url
    FROM cinema c
    JOIN salle  sa ON c.id_cinema = sa.id_cinema
    JOIN seance s  ON sa.id_salle  = s.id_salle
    JOIN film   f  ON s.id_film    = f.id_film
    WHERE c.id_cinema = $1
    ORDER BY f.titre;
  `;
  const result = await pool.query(query, [cinemaId]);
  return result.rows;
};



// models/reservation.model.js
export const getSeancesByFilmAndCinema = async (cinemaId, filmId, nbPlaces) => {
  try {
    const query = `
      SELECT 
        s.id_seance,
        s.date_seance,
        s.heure_debut,
        s.heure_fin,
        s.qualite_projection,
        s.prix AS prix_unitaire,
        sa.nom_salle,
        sa.capacite,
        c.id_cinema,
        c.nom_cinema,
        f.id_film,
        f.titre AS film_titre,
        (sa.capacite - COALESCE(SUM(r.nombre_places),0)) AS places_restantes,

        TO_CHAR(s.date_seance, 'YYYY-MM-DD') AS date_iso,
        TO_CHAR(s.date_seance, 'FMDay DD Mon YYYY') AS date_label

      FROM seance s
      JOIN salle sa   ON s.id_salle = sa.id_salle
      JOIN cinema c   ON sa.id_cinema = c.id_cinema
      JOIN film f     ON s.id_film   = f.id_film
      LEFT JOIN reservation r 
        ON r.id_seance = s.id_seance
        AND r.etat = 'CONFIRMEE'

      WHERE c.id_cinema = $1
        AND ($2::INT IS NULL OR f.id_film = $2)

        -- 🚨 FILTRE DES SÉANCES FUTURES
        AND (
              s.date_seance > CURRENT_DATE
           OR (s.date_seance = CURRENT_DATE AND s.heure_fin > NOW()::time)
        )

      GROUP BY 
        s.id_seance, s.date_seance, s.heure_debut, s.heure_fin, 
        s.qualite_projection, s.prix, sa.nom_salle, sa.capacite,
        c.id_cinema, c.nom_cinema, f.id_film, f.titre

      HAVING (sa.capacite - COALESCE(SUM(r.nombre_places),0)) >= $3

      ORDER BY s.date_seance ASC, s.heure_debut ASC, s.id_seance ASC;
    `;

    const result = await pool.query(query, [cinemaId, filmId || null, nbPlaces]);
    return result.rows ?? [];
  } catch (error) {
    console.error("Erreur modèle (getSeancesByFilmAndCinema):", error.message);
    throw error;
  }
};


// CRUD basique
export async function getReservationById(id) {
  const sql = 'SELECT * FROM reservation WHERE id_reservation = $1;';
  const { rows } = await pool.query(sql, [id]);
  return rows[0];
}

// Extraction enrichie pour dashboard / miroir
export async function getReservationsBatch(fromId = 0, limit = 500) {
  const sql = `
    SELECT
      r.id_reservation,
      r.nombre_places,
      r.prix_total,
      r.etat,
      u.id_user, u.username, u.email,
      f.id_film, f.titre, f.genre,
      sa.id_salle, sa.nom_salle, sa.capacite,
      c.id_cinema, c.nom_cinema, c.ville,
      s.id_seance, s.date_seance, s.heure_debut, s.heure_fin,
      (s.date_seance::timestamp + s.heure_debut) AS show_start_at,
      (s.date_seance::timestamp + s.heure_fin)   AS show_end_at,
      s.qualite_projection,
      s.prix,
      COALESCE(
        ARRAY(
          SELECT si.numero_siege
          FROM reservation_siege rs
          JOIN siege si ON si.id_siege = rs.id_siege
          WHERE rs.id_reservation = r.id_reservation
          ORDER BY si.numero_siege
        ), ARRAY[]::varchar[]
      ) AS sieges
    FROM reservation r
    JOIN utilisateur u ON u.id_user = r.id_user
    JOIN seance s      ON s.id_seance = r.id_seance
    JOIN film f        ON f.id_film   = s.id_film
    JOIN salle sa      ON sa.id_salle = s.id_salle
    JOIN cinema c      ON c.id_cinema = sa.id_cinema
    WHERE r.id_reservation > $1
    ORDER BY r.id_reservation
    LIMIT $2;
  `;
  const { rows } = await pool.query(sql, [fromId, limit]);
  return rows;
}

export async function fetchReservationById(idReservation) {
  const sql = `
    SELECT
      r.id_reservation,
      r.nombre_places,
      r.prix_total,
      r.etat,

      u.id_user, u.username, u.email,

      f.id_film, f.titre, f.genre,

      sa.id_salle, sa.nom_salle, sa.capacite,

      c.id_cinema, c.nom_cinema, c.ville,

      s.id_seance,
      s.date_seance,
      s.heure_debut,
      s.heure_fin,
      (s.date_seance::timestamp + s.heure_debut) AS show_start_at,
      (s.date_seance::timestamp + s.heure_fin)   AS show_end_at,
      s.qualite_projection,
      s.prix,

      COALESCE(
        ARRAY(
          SELECT si.numero_siege
          FROM reservation_siege rs
          JOIN siege si ON si.id_siege = rs.id_siege
          WHERE rs.id_reservation = r.id_reservation
          ORDER BY si.numero_siege
        ), ARRAY[]::varchar[]
      ) AS sieges

    FROM reservation r
    JOIN utilisateur u ON u.id_user   = r.id_user
    JOIN seance      s ON s.id_seance = r.id_seance
    JOIN film        f ON f.id_film   = s.id_film
    JOIN salle      sa ON sa.id_salle = s.id_salle
    JOIN cinema      c ON c.id_cinema = sa.id_cinema

    WHERE r.id_reservation = $1
    LIMIT 1;
  `;
  const { rows } = await pool.query(sql, [idReservation]);
  return rows; // ⬅️ retourne un tableau (comme pour le batch), 0 ou 1 élément
}

// models/reservation.model.js
export async function fetchChangedSince(sinceIsoString) {
  const sql = `
    SELECT
      r.id_reservation,
      r.nombre_places,
      r.prix_total,
      r.etat,

      u.id_user, u.username, u.email,

      f.id_film, f.titre, f.genre,

      sa.id_salle, sa.nom_salle, sa.capacite,

      c.id_cinema, c.nom_cinema, c.ville,

      s.id_seance,
      s.date_seance,
      s.heure_debut,
      s.heure_fin,
      (s.date_seance::timestamp + s.heure_debut) AS show_start_at,
      (s.date_seance::timestamp + s.heure_fin)   AS show_end_at,
      s.qualite_projection,
      s.prix,

      COALESCE(
        ARRAY(
          SELECT si.numero_siege
          FROM reservation_siege rs
          JOIN siege si ON si.id_siege = rs.id_siege
          WHERE rs.id_reservation = r.id_reservation
          ORDER BY si.numero_siege
        ), ARRAY[]::varchar[]
      ) AS sieges

    FROM reservation r
    JOIN utilisateur u ON u.id_user   = r.id_user
    JOIN seance      s ON s.id_seance = r.id_seance
    JOIN film        f ON f.id_film   = s.id_film
    JOIN salle      sa ON sa.id_salle = s.id_salle
    JOIN cinema      c ON c.id_cinema = sa.id_cinema
    WHERE r.updated_at > $1
    ORDER BY r.updated_at ASC, r.id_reservation ASC
    LIMIT 1000;
  `;
  const { rows } = await pool.query(sql, [sinceIsoString]);
  return rows;
}
