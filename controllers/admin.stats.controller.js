import { getWeeklyReservationsByFilmService } from "../services/admin.stats.service.js";

export const weeklyFilmsStatsController = async (req, res, next) => {
  try {
    const data = await getWeeklyReservationsByFilmService();
    res.json(data);
  } catch (error) {
    console.error("❌ STATS Controller:", error);
    next(error);
  }
};
