import app from './app.js';
import { startPgListener } from "./services/pgListener.js";
import { startSyncPoller } from "./services/sync.poller.js";

const PORT = process.env.PORT || 3000;

app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Serveur lancé sur http://0.0.0.0:${PORT}`);
});

startPgListener().catch(console.error);
startSyncPoller(15000);