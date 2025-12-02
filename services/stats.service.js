// services/stats.service.js
import ReservationsMirror from "../models/reservationsMirror.model.js";
export async function getWeeklyTotalsByFilm({ days = 7 } = {}) {

  console.log("✅ SERVICE STATS RELANCÉ — DAYS =", days);

  const now = new Date();
  const start = new Date();
  start.setDate(now.getDate() - days);
  ...

/**
 * US12 — Dashboard NO SQL
 * Réservations par film sur X jours (par défaut 7)
 * Source : MongoDB – collection reservations_mirror
 * Règle métier : on utilise UNIQUEMENT reservedAt
 */
export async function getWeeklyTotalsByFilm({ days = 7 } = {}) {

  // ✅ calcul des bornes temporelles
  const now = new Date();
  const start = new Date();
  start.setDate(now.getDate() - days);

  // ✅ pipeline MongoDB
  const rows = await ReservationsMirror.aggregate([

    // ignorer les entrées invalides
    {
      $match: {
        reservedAt: { $exists: true }
      }
    },

    // filtre période 7 jours
    {
      $match: {
        reservedAt: { $gte: start, $lte: now }
      }
    },

    // groupement par film
    {
      $group: {
        _id: "$film.titre",
        reservations: { $sum: 1 }
      }
    },

    // tri décroissant
    {
      $sort: { reservations: -1 }
    }

  ]);

  // format propre pour la vue / API
  return rows.map(r => ({
    film: r._id,
    reservations: r.reservations
  }));
}


/**
 * Liste des cinémas disponibles depuis MongoDB
 * (utile pour filtres ultérieurs)
 */
export async function getDistinctCinemasFromMirror() {
  const rows = await ReservationsMirror.aggregate([
    {
      $group: {
        _id: {
          id: "$cinema.id",
          nom: "$cinema.nom",
          ville: "$cinema.ville"
        }
      }
    },
    {
      $sort: { "_id.nom": 1 }
    }
  ]);

  return rows.map(r => r._id);
};