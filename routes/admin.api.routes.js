// routes/admin.api.routes.js
import { Router } from "express";
import { requireAdmin } from "../middlewares/authMiddleware.js";
import { weeklyFilmsStatsController } from "../controllers/admin.stats.controller.js";

const routerApi = Router();

// ✅ API DU DASHBOARD (OFFICIELLE)
routerApi.get(
  "/admin/api/dashboard/weekly-films",
  requireAdmin,
  weeklyFilmsStatsController
);

export default routerApi;
