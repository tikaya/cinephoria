// services/sync.poller.js
import { fetchChangedSince } from "../models/reservation.model.js";
import { upsertBatch } from "./mirror.load.js";

let last = new Date(0);
export function startSyncPoller(intervalMs = 15000) {
  setInterval(async () => {
    try {
      const rows = await fetchChangedSince(last.toISOString());
      if (rows.length) {
        await upsertBatch(rows);
        last = new Date(); // ou max(rows.updated_at)
      }
    } catch (e) {
      console.error("poller error", e);
    }
  }, intervalMs);
}
