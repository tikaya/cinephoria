import { getReservationDetailsModel } from "../models/user.note.model.js";
import { canUserRateService } from "../services/user.note.service.js";
import { insertUserNoteService } from "../services/user.note.service.js";

export async function renderNoteForm(req, res) {
  const idReservation = req.params.id_reservation;
  const user = req.session.user;

  const reservation = await getReservationDetailsModel(idReservation);

  if (!reservation || reservation.id_user !== user.id) {
    return res.status(403).send("Accès refusé.");
  }

  const canRate = await canUserRateService(
    user.id,
    reservation.id_film,
    reservation.id_seance
  );

  if (!canRate) {
    req.flash("error", "Vous ne pouvez pas noter cette séance.");
    return res.redirect("/user/espace");
  }

  return res.render("user/noter", {
    title: "Noter le film",
    currentUser: user,
    reservation
  });
}


export async function submitNoteController(req, res) {
  const idReservation = req.params.id_reservation;
  const user = req.session.user;
  const { note, description } = req.body;

  const reservation = await getReservationDetailsModel(idReservation);

  if (!reservation || reservation.id_user !== user.id) {
    return res.status(403).send("Accès refusé.");
  }

  const canRate = await canUserRateService(
    user.id,
    reservation.id_film,
    reservation.id_seance
  );

  if (!canRate) {
    req.flash("error", "Vous ne pouvez pas noter cette séance.");
    return res.redirect("/user/espace");
  }

  await insertUserNoteService(
    user.id,
    reservation.id_film,
    reservation.id_seance,
    note,
    description
  );

  req.flash("success", "Votre note a bien été envoyée !");
  return res.redirect("/user/espace");
}
