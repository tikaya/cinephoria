import {
  getPendingAvisService,
  validateAvisService,
  refuseAvisService
} from "../services/employe.avis.service.js";

export async function renderAvisList(req, res) {
  const avis = await getPendingAvisService();

  res.render("employe/avis", {
    title: "Modération des avis",
    currentUser: req.session.user,
    avis,
    success: req.flash("success") || [],
    error: req.flash("error") || []
  });
}

export async function validateAvisController(req, res) {
  const idNote = req.params.id_note;
  const idEmploye = req.session.user.id;

  await validateAvisService(idNote, idEmploye);

  req.flash("success", "Avis validé !");
  return res.redirect("/intranet/avis");
}

export async function refuseAvisController(req, res) {
  const idNote = req.params.id_note;

  await refuseAvisService(idNote);

  req.flash("success", "Avis supprimé.");
  return res.redirect("/intranet/avis");
}
