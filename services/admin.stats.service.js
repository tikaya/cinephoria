import { getWeeklyStatsByFilmModel } from "../models/admin.stats.model.js";

export const getWeeklyReservationsByFilmService = async () => {

  const rawStats = await getWeeklyStatsByFilmModel(7);

  return rawStats.map(row => ({
    film: row.film,
    reservations: row.total
  }));
};


export async function getCounts() {
  const [
    totalReservations,
    totalFilms,
    totalCinemas
  ] = await Promise.all([
    ReservationsMirror.countDocuments(),
    ReservationsMirror.distinct("film.id").then(r => r.length),
    ReservationsMirror.distinct("cinema.id").then(r => r.length)
  ]);

  return {
    reservations: totalReservations,
    films: totalFilms,
    cinemas: totalCinemas
  };
}
