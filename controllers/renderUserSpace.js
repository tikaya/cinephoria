import { getReservationsByUserService } from "../services/user.reservation.service.js";
import { canUserRateService } from "../services/user.note.service.js";

export async function renderUserSpace(req, res) {
  const user = req.session.user;

  const reservations = await getReservationsByUserService(user.id);

  for (let r of reservations) {
    const can = await canUserRateService(
      user.id,
      r.id_film,
      r.id_seance
    );

    r.can_rate = can;
  }

  return res.render("user/espace", {
    title: "Mon espace",
    currentUser: user,
    reservations
  });
}
