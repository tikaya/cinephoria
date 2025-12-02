import pool from "../config/db.js";

//Cherchons dans la bse de donnée si email exite bien 
export async function findByEmail(email) {
    const {rows} = await pool.query(
        "SELECT id_employe FROM employe WHERE email_employe = $1",
        [email]
    );
    return rows[0] || null;
}


//fonction qui met a jour le mode de passe dans la base postgresql

export async function updatePassword(id_employe,hash) {
    await pool.query(
        "UPDATE employe SET password_hash= $1 WHERE id_employe = $2",
    [hash,id_employe]);
}