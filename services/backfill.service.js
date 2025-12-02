import { getReservationsBatch } from "../models/reservation.model.js";
import { upsertBatch } from "../services/mirror.load.js";

export async function backfillAll({ fromId = 0, batchSize = 500, maxBatches = 10000 } = {}) {
  let cursor = fromId, batches = 0, totalRows = 0, totalUpserts = 0;
  while (batches < maxBatches) {
    const rows = await getReservationsBatch(cursor, batchSize);
    if (!rows.length) break;
    const res = await upsertBatch(rows);
    totalRows += rows.length;
    totalUpserts += (res.upserted || 0) + (res.modified || 0);
    cursor = rows[rows.length - 1].id_reservation;
    batches++;
  }
  return { fromId, lastId: cursor, batches, totalRows, totalUpserts };
};