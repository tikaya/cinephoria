import ReservationsMirror from "./reservationsMirror.model.js";

export const getWeeklyStatsByFilmModel = async (days = 7) => {

  const limitDate = new Date();
  limitDate.setDate(limitDate.getDate() - days);

  const result = await ReservationsMirror.aggregate([

    // Date à utiliser
    {
      $addFields: {
        statDate: { $ifNull: ["$reservedAt", "$syncedAt"] }
      }
    },

    // Filtrer les 7 derniers jours
    {
      $match: {
        statDate: { $gte: limitDate }
      }
    },

    // Comptage par film
    {
      $group: {
        _id: "$film.titre",
        total: { $sum: 1 }
      }
    },

    // Tri
    {
      $sort: { total: -1 }
    }

  ]);

  return result.map(r => ({
    film: r._id,
    total: r.total
  }));
};
