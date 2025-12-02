import pool from '../config/db.js';

export const isEmailUsed =async (email) => {
   const result= await pool.query('SELECT 1 FROM utilisateur WHERE email = $1',[email]);
    return result.rowCount > 0;
}

export const isPseudoTaken = async (pseudo) => {
    const result = await pool.query('SELECT 1 FROM  utilisateur WHERE username = $1',[pseudo]);
    return result.rowCount > 0;
}
// ➕ Ajoute un utilisateur dans la base et retourne les données (sauf mot de passe)

export const addUserInDb = async ({ prenom, nom, pseudo, email, password }) => {
    const result = await pool.query(
        'INSERT INTO utilisateur (prenom_user, nom_user, username, email, password) VALUES ($1, $2, $3, $4, $5) RETURNING id_user AS id, prenom_user AS prenom, nom_user AS nom, username, email',
        [prenom, nom, pseudo, email, password]
    )
    return result.rows[0]; // Retourne l'utilisateur ajouté
}