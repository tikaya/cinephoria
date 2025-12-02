import pool from '../config/db.js';

export const getFilmsDernierMercredi = async () => {
  const query = `
    SELECT *
    FROM film
    WHERE date_trunc('day', date_ajout) =
          date_trunc('week', CURRENT_DATE) + INTERVAL '2 days';
  `;
  const result = await pool.query(query);
  return result.rows;
};
