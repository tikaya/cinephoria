import app from './app.js';
import { startPgListener } from "./services/pgListener.js";
import { startSyncPoller } from "./services/sync.poller.js";

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`🚀 Serveur lancé sur http://localhost:${PORT}`);
});

startPgListener().catch(console.error);
startSyncPoller(15000);