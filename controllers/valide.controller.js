import { createReservationWithChecks } from "../services/valide.service.js";

export const create = async (req, res) => {
  try {
    const id_user = req.session?.user?.id;
    const id_seance = parseInt(req.body.seanceId);
    const prix_total = parseFloat(req.body.prix);
    const sieges = req.body.sieges
      .split(",")
      .map(s => parseInt(s));

    if (
      !id_user ||
      !id_seance ||
      !Array.isArray(sieges) ||
      sieges.length === 0 ||
      isNaN(prix_total)
    ) {
      return res.status(400).render("error", {
        message: "Données manquantes ou invalides",
      });
    }

    const nouvelleReservation = await createReservationWithChecks(
      id_user,
      id_seance,
      sieges,
      prix_total
    );

    // ✅ Redirection vers l’espace commandes
    return res.redirect("/espace/commandes");
  } catch (error) {
    console.error("Erreur contrôleur reservation :", error.message);
    return res.status(500).render("error", {
      message: "Échec de la réservation",
    });
  }
};
