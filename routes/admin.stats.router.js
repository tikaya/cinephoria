import { Router } from "express";
import { requireAdmin } from "../middlewares/authMiddleware.js";

const router = Router();

// ✅ PAGE dashboard
router.get("/admin/dashboard/stats/weekly-films", requireAdmin, (req, res) => {
  res.render("admin/dashboard-weekly-films");
});

export default router;
