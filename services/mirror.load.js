// Exigeons la fonction ReservationsMirror
import ReservationsMirror from "../models/reservationsMirror.model.js";



//Cette fonction va mapper les données de la base de données PostgreSQL vers MongoDB
// en prennant un ligne de PG et la transformant en document MongoDB
//👉 Cette fonction prend une ligne PG (row) et la transforme en un document JSON conforme à ton modèle Mongo.
export function toMongoDoc(row) {
  return {
    _id: row.id_reservation,
    nbrPlaces: row.nombre_places,
    prixTotal: Number(row.prix_total),
    etat: row.etat,
    user: { id: row.id_user, username: row.username, email: row.email },
    film: { id: row.id_film, titre: row.titre, genre: row.genre },
    salle: { id: row.id_salle, nom: row.nom_salle, capacite: row.capacite },
    cinema: { id: row.id_cinema, nom: row.nom_cinema, ville: row.ville },
    seance: {
      id: row.id_seance,
      dateSeance: row.date_seance,        // type DATE → JS Date ok
      heureDebut: row.heure_debut,        // strings OK si tu préfères
      heureFin: row.heure_fin,
      showStartAt: row.show_start_at,     // timestamps calculés en SQL
      showEndAt: row.show_end_at,
      qualite_projection: row.qualite_projection,
      prix: Number(row.prix)
    },
    sieges: row.sieges || [],
    // si tu ajoutes plus tard created_at/updated_at:
    // reservedAt: row.reserved_at,
    // updatedAt: row.updated_at,
    syncedAt: new Date()
  };
}

export async function upsertBatch(rows) {
  if (!rows?.length) return { matched: 0, modified: 0, upserted: 0 };
  const ops = rows.map(r => ({
    updateOne: {
      filter: { _id: r.id_reservation },
      update: { $set: toMongoDoc(r) },
      upsert: true
    }
  }));
  const res = await ReservationsMirror.bulkWrite(ops, { ordered: false });
  const out = {
    matched: res.matchedCount || 0,
    modified: res.modifiedCount || 0,
    upserted: res.upsertedCount || 0
  };
  console.debug(`[MIRROR] bulkWrite → ${JSON.stringify(out)}`);
  return out;
}