// controllers/dashboard.controller.js
import { getReservationsLast7Days } from '../services/admin.stats.service.js';
import { getAllCinemas, getFilmsByCinemaId } from '../models/reservation.model.js';

export async function renderReservations7j(req, res) {
  try {
    const cinemaId = req.query.cinemaId ? parseInt(req.query.cinemaId, 10) : null;
    const filmId   = req.query.filmId   ? parseInt(req.query.filmId, 10)   : null;

    const data    = await getReservationsLast7Days({ cinemaId, filmId });
    const cinemas = await getAllCinemas();
    const films   = cinemaId ? await getFilmsByCinemaId(cinemaId) : [];

    res.render('admin/dashboard/reservations-7j', {
      title: 'Dashboard — Réservations (7 jours)',   // ✅ ajout
      data, cinemas, films, cinemaId, filmId
    });
  } catch (e) {
    console.error('[Dashboard] error', e);
    res.status(500).render('500');
  }
}
