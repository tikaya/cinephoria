import { getReservationByUser } from "../services/espace.service.js";

export const getReservationsPage = async (req, res) => {
  try {
    const id_user = req.session?.user?.id;
    const reservations = await getReservationByUser(id_user);

    res.render("espace/commandes", { reservations });
  } catch (error) {
    console.error("❌ Erreur dans getReservationsPage :", error.message);
    console.error("🔍 Stack trace :", error.stack); // Ajouté pour plus de détails
    res.status(500).render("error", {
      message: "Erreur serveur lors de l'affichage des réservations."
    });
  }
};
