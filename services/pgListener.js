// workers/pgListener.js
import pg from "pg";
import { pgConfig } from "../config/db.js";
import { syncOne } from "../services/syncOne.js";

const { Client } = pg;

export async function startPgListener() {
  const client = new Client(pgConfig);   // ✅ même source que le Pool
  await client.connect();
  await client.query("LISTEN reservation_changed");
  console.log("[PG] Listening on reservation_changed");

  const pending = new Set();
  let timer = null;
  async function flush() {
    const ids = Array.from(pending);
    pending.clear();
    for (const id of ids) {
      try { await syncOne(id); } catch (e) { console.error("syncOne fail", id, e); }
    }
  }
client.on("notification", (msg) => {
  const id = Number(msg.payload);
  if (Number.isFinite(id)) {
    console.log(`[PG→LISTENER] NOTIFY reservation_changed payload=${id}`);
    pending.add(id);
    clearTimeout(timer);
    timer = setTimeout(flush, 300);
  }
});
  client.on("error", (e) => console.error("[PG] listener error", e));

}
