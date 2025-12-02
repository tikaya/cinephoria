export const logoutUser = (req, res) => {
  try {
    if (!req.session) {
      console.warn("⚠️ Pas de session active au moment du logout.");
      return res.redirect("/login");
    }

    // 💡 Stocker les messages AVANT de détruire la session
    req.flash("success", "Vous êtes déconnecté avec succès !");

    // Ensuite seulement on détruit la session
    req.session.destroy(err => {
      if (err) {
        console.error("Erreur destruction session :", err);
        req.flash("error", "Impossible de se déconnecter.");
        return res.redirect("/");
      }

      // Supprimer le cookie du client
      res.clearCookie("sid"); // ton nom exact de cookie
      return res.redirect("/login");
    });

  } catch (error) {
    console.error("Erreur durant la déconnexion :", error);
    res.redirect("/");
  }
};
