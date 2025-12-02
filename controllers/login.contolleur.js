// controllers/auth.controller.js
import { loginService } from "../services/login.service.js";
import { homeService } from "../services/home.service.js";

// ----------------------------------------------
// GET /login – Affiche la page de connexion
// ----------------------------------------------
export const connectPageController = (req, res) => {
  res.render("login", {
    errorMessage: null,
    email: "",
    redirect: req.query.redirect || "",
    success: req.flash("success") || [],
    error: req.flash("error") || []
  });
};


// ----------------------------------------------
// POST /login – Traitement de la connexion
// ----------------------------------------------
export const loginController = async (req, res) => {
  const { email, password } = req.body;
  const redirect = req.body.redirect || req.query.redirect || "/";

  try {
    const result = await loginService(email, password);

    // ❌ Mauvais identifiants
    if (result?.error) {
      return res.render("login", {
        errorMessage: "Identifiants invalides",
        email,
        redirect,
        success: req.flash("success") || [],
        error: req.flash("error") || []
      });
    }

    // ✅ US11 — mot de passe temporaire
    if (result.password_temp === true) {
      req.session.tempUser = result.id;
      return res.redirect("/force-password-change");
    }

    // ✅ Stockage utilisateur
    req.session.user = {
      id: result.id,
      email: result.email,
      role: result.role,
      type: result.type,
      username: result.username ?? null
    };

    const roleUpper = String(result.role || result.type || "").toUpperCase();

    // ✅ Redirection employé
    if (roleUpper === "EMPLOYEE" || roleUpper === "EMPLOYE") {
      return res.redirect("/employe/home");
    }

    // ✅ Redirection user normal
    return res.redirect(redirect || "/user/espace");

  } catch (err) {
    console.error("[LOGIN] controller error:", err);

    return res.status(500).render("login", {
      errorMessage: err.message,  // 👈 Affiche la VRAIE erreur
      email,
      redirect,
      success: req.flash("success") || [],
      error: req.flash("error") || []
    });
  }
};
