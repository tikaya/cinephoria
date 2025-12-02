import pool from "../config/db.js";

// Liste des avis en attente
export async function getPendingAvisModel() {
  const query = `
    SELECT 
      n.id_note,
      n.note,
      n.commentaire,
      n.id_user,
      f.id_film,
      f.titre,
      u.username,
      u.email
    FROM note n
    JOIN film f ON f.id_film = n.id_film
    JOIN utilisateur u ON u.id_user = n.id_user
    WHERE n.valide_par_employe IS NULL
    ORDER BY n.id_note DESC;
  `;
  const result = await pool.query(query);
  return result.rows;
}

// Validation d’un avis
export async function validateAvisModel(idNote, idEmploye) {
  const query = `
    UPDATE note
    SET valide_par_employe = $1
    WHERE id_note = $2
  `;
  await pool.query(query, [idEmploye, idNote]);
}

// Suppression d’un avis
export async function refuseAvisModel(idNote) {
  const query = `
    DELETE FROM note
    WHERE id_note = $1
  `;
  await pool.query(query, [idNote]);
}
