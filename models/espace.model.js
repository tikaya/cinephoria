import pool from "../config/db.js";

export const findReservationById = async (userId) => {
  const query = `
    SELECT
      r.id_reservation,
      f.titre AS titre_film,
      f.affiche_url,
      s.date_seance,
      s.heure_debut,
      s.heure_fin,
      s.qualite_projection,
      sa.nom_salle,
      c.nom_cinema,                                   -- ✅ ajout
      r.nombre_places,
      r.prix_total,
      json_agg(
        json_build_object(
          'numero', si.numero_siege,                  -- alias "numero" pour ton EJS
          'type',   si.type_siege
        )
        ORDER BY si.numero_siege
      ) AS sieges
    FROM reservation r
    JOIN seance s            ON r.id_seance = s.id_seance
    JOIN film f              ON s.id_film   = f.id_film
    JOIN salle sa            ON s.id_salle  = sa.id_salle
    JOIN cinema c            ON sa.id_cinema = c.id_cinema  -- ✅ jointure cinéma
    JOIN reservation_siege rs ON r.id_reservation = rs.id_reservation
    JOIN siege si            ON rs.id_siege = si.id_siege
    WHERE r.id_user = $1
    GROUP BY
      r.id_reservation, f.titre, f.affiche_url,
      s.date_seance, s.heure_debut, s.heure_fin, s.qualite_projection,
      sa.nom_salle, c.nom_cinema,                    -- ✅ dans le GROUP BY
      r.nombre_places, r.prix_total
    ORDER BY r.id_reservation DESC;
  `;
  const { rows } = await pool.query(query, [userId]);
  return rows;
};
