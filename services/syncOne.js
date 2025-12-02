// services/syncOne.js
import { fetchReservationById } from "../models/reservation.model.js";
import { upsertBatch } from "./mirror.load.js";

export async function syncOne(id) {
  console.log(`[SYNC] Demande de sync pour réservation #${id}`);
  const rows = await fetchReservationById(id);
  if (!rows.length) {
    console.warn(`[SYNC] Aucune réservation trouvée pour #${id} (PG)`);
    return 0;
  }
  const res = await upsertBatch(rows);
  console.log(
    `[SYNC] Réservation #${id} → Mongo OK (matched:${res.matched}, modified:${res.modified}, upserted:${res.upserted})`
  );
  return 1;
}