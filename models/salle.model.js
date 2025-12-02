// models/salle.model.js
import pool from "../config/db.js";
import * as model from '../models/salle.model.js';  // ✅ assure "model" défini

export const findAllSalles = async () => {
  const sql = `
    SELECT s.id_salle, s.nom_salle, s.capacite, s.qualite_projection,
           c.id_cinema, c.nom_cinema, c.ville
    FROM salle s
    LEFT JOIN cinema c ON c.id_cinema = s.id_cinema
    ORDER BY c.nom_cinema ASC, s.nom_salle ASC
  `;
  const { rows } = await pool.query(sql);
  return rows;
};

export const findSalleById = async (id) => {
  const sql = `
    SELECT s.id_salle, s.nom_salle, s.capacite, s.qualite_projection,
           c.id_cinema, c.nom_cinema, c.ville
    FROM salle s
    LEFT JOIN cinema c ON c.id_cinema = s.id_cinema
    WHERE s.id_salle = $1
    LIMIT 1
  `;
  const { rows } = await pool.query(sql, [id]);
  return rows[0] || null;
};

export const insertSalleRow = async ({ nom_salle, capacite, qualite_projection, id_cinema }) => {
  const sql = `
    INSERT INTO salle (nom_salle, capacite, qualite_projection, id_cinema)
    VALUES ($1,$2,$3,$4)
    RETURNING id_salle
  `;
  const { rows } = await pool.query(sql, [nom_salle, capacite, qualite_projection, id_cinema]);
  return rows[0]?.id_salle;
};

export const updateSalleRow = async (id, { nom_salle, capacite, qualite_projection, id_cinema }) => {
  const sql = `
    UPDATE salle
    SET nom_salle = $1,
        capacite = $2,
        qualite_projection = $3,
        id_cinema = $4
    WHERE id_salle = $5
    RETURNING id_salle
  `;
  const { rows } = await pool.query(sql, [nom_salle, capacite, qualite_projection, id_cinema, id]);
  return rows[0]?.id_salle || null;
};

export const deleteSalleRow = async (id) => {
  const sql = `DELETE FROM salle WHERE id_salle = $1 RETURNING id_salle`;
  const { rows } = await pool.query(sql, [id]);
  return rows[0]?.id_salle || null;
};

export async function insert({ nom_salle, capacite=null, qualite_projection=null, id_cinema }) {
  const { rows } = await pool.query(`
    INSERT INTO salle (nom_salle, capacite, qualite_projection, id_cinema)
    VALUES ($1,$2,$3,$4) RETURNING id_salle
  `, [nom_salle, capacite, qualite_projection, id_cinema]);
  return rows[0].id_salle;
}
export async function findById(id) {
  const nid = Number(id);
  if (!Number.isInteger(nid)) return null;
  const { rows } = await pool.query(`
    SELECT s.id_salle, s.nom_salle, s.capacite, s.qualite_projection, s.id_cinema,
           c.nom_cinema, c.ville
    FROM salle s
    LEFT JOIN cinema c ON c.id_cinema = s.id_cinema
    WHERE s.id_salle=$1
    LIMIT 1
  `, [nid]);
  return rows[0] || null;
}


export async function update(id, { nom_salle, capacite=null, qualite_projection=null, id_cinema }) {
  await pool.query(`
    UPDATE salle SET nom_salle=$1, capacite=$2, qualite_projection=$3, id_cinema=$4
    WHERE id_salle=$5
  `, [nom_salle, capacite, qualite_projection, id_cinema, id]);
}
export async function remove(id) {
  // Si des sièges existent, ON DELETE CASCADE est sur siege→salle, donc ok; mais des séances bloqueront (FK)
  await pool.query('DELETE FROM salle WHERE id_salle=$1', [id]);
}

export async function list({ q='', cinemaId=null, limit=12, offset=0 }) {
  const where = [];
  const params = [];
  let i = 1;

  if (q) { where.push(`LOWER(s.nom_salle) LIKE $${i++}`); params.push(`%${q.toLowerCase()}%`); }
  if (cinemaId) { where.push(`s.id_cinema = $${i++}`); params.push(Number(cinemaId)); }
  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const data = await pool.query(`
    SELECT s.id_salle, s.nom_salle, s.capacite, s.qualite_projection, s.id_cinema,
           c.nom_cinema, c.ville,
           COALESCE(COUNT(g.id_siege),0) AS nb_sieges
    FROM salle s
    LEFT JOIN siege g   ON g.id_salle = s.id_salle
    LEFT JOIN cinema c  ON c.id_cinema = s.id_cinema
    ${whereSql}
    GROUP BY s.id_salle, c.nom_cinema, c.ville
    ORDER BY LOWER(c.ville) NULLS LAST, LOWER(c.nom_cinema) NULLS LAST, LOWER(s.nom_salle)
    LIMIT ${limit} OFFSET ${offset}
  `, params);

  const count = await pool.query(`
    SELECT COUNT(*)::int AS c
    FROM salle s
    ${cinemaId ? 'WHERE s.id_cinema = $1' : ''}
  `, cinemaId ? [Number(cinemaId)] : []);

  return { rows: data.rows, total: count.rows[0].c, pageSize: limit };
}

export async function countSieges(id_salle) {
  const { rows } = await pool.query(`SELECT COUNT(*)::int AS c FROM siege WHERE id_salle=$1`, [id_salle]);
  return rows[0].c;
}
export async function countSeances(id_salle) {
  const { rows } = await pool.query(`SELECT COUNT(*)::int AS c FROM seance WHERE id_salle=$1`, [id_salle]);
  return rows[0].c;
}
export async function deleteSeats(id_salle) {
  await pool.query(`DELETE FROM siege WHERE id_salle=$1`, [id_salle]);
}

function toLetters(n) {
  let s = '';
  while (n > 0) { const r = (n - 1) % 26; s = String.fromCharCode(65 + r) + s; n = Math.floor((n - 1) / 26); }
  return s;
}

export async function insertSeatsGrid({ id_salle, rows, cols }) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    const placeholders = [];
    const values = [];
    let p = 1;

    for (let r = 1; r <= rows; r++) {
      const L = toLetters(r);
      for (let c = 1; c <= cols; c++) {
        // 5 colonnes: numero_siege, type_siege, position_x, position_y, id_salle
        placeholders.push(`($${p++}, $${p++}, $${p++}, $${p++}, $${p++})`);
        values.push(`${L}${c}`, 'STANDARD', r, c, id_salle);
      }
    }

    if (placeholders.length === 0) throw new Error('rows*cols = 0 : rien à insérer');

    // ✅ INSERT direct, sans sous-sélection ni alias "t(...)"
    await client.query(
      `INSERT INTO siege (numero_siege, type_siege, position_x, position_y, id_salle)
       VALUES ${placeholders.join(',')}`,
      values
    );

    // (optionnel mais recommandé) synchroniser la capacité
    await client.query(`UPDATE salle SET capacite = $1 WHERE id_salle = $2`, [rows * cols, id_salle]);

    await client.query('COMMIT');
  } catch (e) {
    await client.query('ROLLBACK');
    throw e;
  } finally {
    client.release();
  }
}

// Mettre des sièges en PMR par leurs numéros (A1, B3, …)
export async function markSeatsPMRByNumero(id_salle, numeros) {
  if (!Array.isArray(numeros) || numeros.length === 0) return;
  await pool.query(
    `UPDATE siege SET type_siege = 'PMR'
     WHERE id_salle = $1
       AND numero_siege = ANY($2::text[])`,
    [id_salle, numeros]
  );
}

export async function listSeatsForSeance({ id_salle, id_seance }) {
  const { rows } = await pool.query(
    `
    SELECT
      g.id_siege,
      g.numero_siege,
      g.type_siege,               -- 'STANDARD' / 'PMR'
      g.position_x, g.position_y,
      CASE
        WHEN r.id_reservation IS NULL THEN 'free'
        ELSE 'reserved'
      END AS statut
    FROM siege g
    LEFT JOIN reservation_siege rs
      ON rs.id_siege = g.id_siege
    LEFT JOIN reservation r
      ON r.id_reservation = rs.id_reservation
     AND r.id_seance = $1                 -- filtre sur la séance courante
    WHERE g.id_salle = $2
    ORDER BY g.position_y, g.position_x
    `,
    [id_seance, id_salle]
  );
  return rows;
}
