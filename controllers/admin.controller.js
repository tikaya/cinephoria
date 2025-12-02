import ReservationsMirror from "../models/reservationsMirror.model.js";
import { backfillAll } from "../services/backfill.service.js";

export async function getDashboardReservations(req, res, next) {
  try {
    const page = Math.max(1, parseInt(req.query.page || "1", 10));
    const limit = 20, skip = (page - 1) * limit;

    const [items, total] = await Promise.all([
      ReservationsMirror.find({})
        .sort({ "seance.showStartAt": -1, _id: -1 })
        .skip(skip).limit(limit).lean(),
      ReservationsMirror.countDocuments({})
    ]);

    res.render("admin/dashboard/reservationsBackfill", {
      items, page, pages: Math.ceil(total / limit),
       csrfToken: req.csrfToken(),
      flash: res.locals.flash // si tu utilises connect-flash
    });
  } catch (e) { next(e); }
}

export async function postBackfill(req, res, next) {
  try {
    const { fromId = 0, batchSize = 500, maxBatches = 10000 } = req.body || {};
    const out = await backfillAll({
      fromId: Number(fromId), batchSize: Number(batchSize), maxBatches: Number(maxBatches)
    });
    req.flash?.("success", `Backfill OK: ${out.totalUpserts} upserts (lastId=${out.lastId})`);
    res.redirect("/admin/dashboard/reservations");
  } catch (e) {
    req.flash?.("error", e.message);
    next(e);
  }
}
