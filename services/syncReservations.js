// Importons getReservationsBatch → va chercher les réservations en Postgres (tes rows)
import { getReservationsBatch } from "../models/reservation.model.js";

// Importons la fonction upsertBatch → insère ou met à jour dans MongoDB
import { upsertBatch } from "./mirror.load.js";

// Importons le pool PG
import pool from "../config/db.js";

// ⚠️ Si tu exécutes ce fichier comme script indépendant,
// il faut importer mongo.js pour établir la connexion
import "../config/mongo.js";

export async function backfillReservations({ fromId = 0, batchSize = 5 }) {
  try {
    // 1. Récupère un batch depuis PG
    const rows = await getReservationsBatch(fromId, batchSize);
    console.log(`[PG] Fetched ${rows.length} reservations`);

    if (!rows.length) return;

    // 2. Map & Load dans Mongo
    const result = await upsertBatch(rows);
    console.log(`[Mongo] Sync result:`, result);

  } catch (err) {
    console.error("Error during backfill:", err);
  }
}

// petit test exécutable
if (process.argv[1].includes("syncReservations.js")) {
  (async () => {
    await backfillReservations({ fromId: 0, batchSize: 5 });
    await pool.end(); // ferme PG
    process.exit(0);
  })();
}
