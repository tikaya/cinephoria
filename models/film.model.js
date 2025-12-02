import pool from "../config/db.js";

/**
 * Récupère les films avec filtres et regroupe les séances/cinémas
 * pour éviter les doublons.
 */
export const filmFilter = async (cinemaId = null, genre = null, date = null) => {
  const query = `
    SELECT 
      f.id_film,
      f.titre,
      f.description,
      f.age_minimum,
      f.label_coup_de_coeur,
      f.genre,
      f.affiche_url,
      COALESCE(ROUND(AVG(n.note) / 2, 1), 0) AS note_moyenne,
      
      -- On regroupe les séances/cinémas dans un tableau JSON
      COALESCE(JSON_AGG(DISTINCT JSONB_BUILD_OBJECT(
        'cinema', c.nom_cinema,
        'date', s.date_seance,
        'heure_debut', s.heure_debut,
        'heure_fin', s.heure_fin
      )) FILTER (WHERE s.id_seance IS NOT NULL), '[]') AS seances

    FROM Film f
    LEFT JOIN Note n ON n.id_film = f.id_film
    LEFT JOIN Seance s ON s.id_film = f.id_film
    LEFT JOIN Salle sa ON sa.id_salle = s.id_salle
    LEFT JOIN Cinema c ON c.id_cinema = sa.id_cinema

    WHERE 
      ($1::INT IS NULL OR c.id_cinema = $1)
      AND ($2::TEXT IS NULL OR f.genre = $2)
      AND ($3::DATE IS NULL OR s.date_seance = $3)

    GROUP BY 
      f.id_film, f.titre, f.description, f.age_minimum,
      f.label_coup_de_coeur, f.genre, f.affiche_url
    ORDER BY f.titre;
  `;

  const result = await pool.query(query, [cinemaId, genre, date]);
  return result.rows;
};

/** Récupère la liste des genres distincts */
export const getAllGenres = async () => {
  const result = await pool.query(`
    SELECT DISTINCT genre 
    FROM Film
    ORDER BY genre;
  `);
  return result.rows.map(row => row.genre);
};



export async function insert({ titre, description, age_minimum = null, label_coup_de_coeur = false, genre, affiche_url = null }) {
  const sql = `
    INSERT INTO film (titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url)
    VALUES ($1,$2,$3,$4,$5,$6)
    RETURNING id_film
  `;
  const values = [titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url];
  const { rows } = await pool.query(sql, values);
  return rows[0].id_film;
}

export async function findById(id) {
  const nid = Number(id);
  if (!Number.isInteger(nid)) {
    const e = new Error('ID de film invalide');
    e.code = 'FILM_ID_INVALID';
    throw e;
  }
  const { rows } = await pool.query(`
    SELECT id_film, titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url, date_ajout
    FROM film WHERE id_film = $1
    LIMIT 1
  `, [nid]);
  return rows[0] || null;
}
export async function update(id, { titre, description, age_minimum = null, label_coup_de_coeur = false, genre, affiche_url = null }) {
  const sql = `
    UPDATE film SET
      titre=$1,
      description=$2,
      age_minimum=$3,
      label_coup_de_coeur=$4,
      genre=$5,
      affiche_url=$6
    WHERE id_film=$7
  `;
  await pool.query(sql, [titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url, id]);
}

export async function remove(id) {
  await pool.query('DELETE FROM film WHERE id_film=$1', [id]);
}

export async function list({ q = '', limit = 12, offset = 0 }) {
  const hasQ = q.length > 0;
  const where = hasQ ? 'WHERE lower(titre) LIKE $1' : '';
  const params = [];
  if (hasQ) params.push(`%${q.toLowerCase()}%`);

  const data = await pool.query(`
    SELECT id_film, titre, genre, age_minimum, label_coup_de_coeur, date_ajout
    FROM film
    ${where}
    ORDER BY date_ajout DESC, id_film DESC
    LIMIT ${limit} OFFSET ${offset}
  `, params);

  const count = await pool.query(`
    SELECT COUNT(*)::int AS c FROM film ${where}
  `, params);

  return { rows: data.rows, total: count.rows[0].c, pageSize: limit };
}


export async function getFutureSeancesForFilm(idFilm) {
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
      c.id_cinema,
      c.nom_cinema,
      c.ville
    FROM seance s
    JOIN salle sa ON sa.id_salle = s.id_salle
    JOIN cinema c ON c.id_cinema = sa.id_cinema
    WHERE s.id_film = $1
      AND (
        s.date_seance > CURRENT_DATE
        OR (s.date_seance = CURRENT_DATE AND s.heure_fin > CURRENT_TIME)
      )
    ORDER BY s.date_seance ASC, s.heure_debut ASC;
  `;
  const result = await pool.query(query, [idFilm]);
  return result.rows;
}

export async function getValidatedAvisForFilm(idFilm) {
  const query = `
    SELECT 
      n.id_note,
      n.note,
      n.commentaire,
      n.id_user,
      u.username,
      u.email
    FROM note n
    JOIN utilisateur u ON u.id_user = n.id_user
    WHERE n.id_film = $1
      AND n.valide_par_employe IS NOT NULL
    ORDER BY n.id_note DESC;
  `;
  const result = await pool.query(query, [idFilm]);
  return result.rows;
}



export async function getFilmAvisStats(idFilm) {
  const query = `
    SELECT 
      COALESCE(AVG(note), 0)::numeric(4,2) AS avg_note,
      COUNT(*) AS nb_avis
    FROM note
    WHERE id_film = $1
      AND valide_par_employe IS NOT NULL;
  `;
  const result = await pool.query(query, [idFilm]);
  return result.rows[0];
}

export async function getFilmFullDetailsModel(idFilm) {
  const sql = `
    SELECT 
      f.id_film,
      f.titre,
      f.description,
      f.affiche_url,
      f.genre,
      f.age_minimum,
      f.label_coup_de_coeur,
      COALESCE(ROUND(AVG(n.note) / 2, 1), 0) AS note_moyenne
    FROM film f
    LEFT JOIN note n ON n.id_film = f.id_film AND n.valide_par_employe = true
    WHERE f.id_film = $1
    GROUP BY f.id_film
  `;

  const { rows } = await pool.query(sql, [idFilm]);
  if (rows.length === 0) return null;

  const film = rows[0];

  // Séances à venir
  const seancesSql = `
    SELECT 
      s.id_seance,
      s.date_seance,
      s.heure_debut,
      s.heure_fin,
      s.prix,
      c.nom_cinema,
      sa.nom_salle
    FROM seance s
    JOIN salle sa ON sa.id_salle = s.id_salle
    JOIN cinema c ON c.id_cinema = sa.id_cinema
    WHERE s.id_film = $1
      AND (s.date_seance + s.heure_fin::time) >= NOW()
    ORDER BY s.date_seance, s.heure_debut;
  `;

  const seances = await pool.query(seancesSql, [idFilm]);
  film.seances = seances.rows;

  // Avis validés
  const avisSql = `
    SELECT 
      n.note,
      n.commentaire,
      u.username,
      n.date_creation
    FROM note n
    JOIN utilisateur u ON u.id_user = n.id_user
    WHERE n.id_film = $1
      AND n.valide_par_employe = true
    ORDER BY n.date_creation DESC;
  `;

  const avis = await pool.query(avisSql, [idFilm]);
  film.avis = avis.rows;

  return film;
}
