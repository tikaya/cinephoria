import pool from '../config/db.js';

export const getFilmsDernierMercredi = async () => {
  const query = `
    WITH dernier_mercredi AS (
      SELECT date_trunc('day', date_ajout) AS mercredi
      FROM film
      WHERE EXTRACT(DOW FROM date_ajout) = 3
      ORDER BY date_ajout DESC
      LIMIT 1
    )
    SELECT *
    FROM film
    WHERE date_trunc('day', date_ajout) = (SELECT mercredi FROM dernier_mercredi);
  `;
  const result = await pool.query(query);
  return result.rows;
};
