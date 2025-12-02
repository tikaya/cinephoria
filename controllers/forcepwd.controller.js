import { changePasswordService } from "../services/forcepwd.service.js";

export const renderForcePasswordChange = (req, res) => {
  res.render("auth/forcepwd", { errorMessage: null });
};

export const submitForcePasswordChange = async (req, res) => {
  try {
    const { password } = req.body;
    const id = req.session.tempUser;

    // 🔐 Sécurité
    if (!id) {
      return res.redirect("/login");
    }

    // ❌ Mot de passe trop court
    if (!password || password.length < 6) {
      return res.render("auth/forcepwd", {
        errorMessage: "Mot de passe trop court (6 caractères minimum)."
      });
    }

    // ✅ Enregistrement du nouveau mot de passe
    await changePasswordService(id, password);

    // ✅ Nettoyage session temporaire
    delete req.session.tempUser;

    // ✅ Connexion automatique
    req.session.user = { id };

    res.redirect("/");

  } catch (error) {
    console.error("🚨 ERREUR FORCE PASSWORD:", error.message);

    return res.render("auth/forcepwd", {
      errorMessage: "Erreur interne : " + error.message
    });
  }
};
