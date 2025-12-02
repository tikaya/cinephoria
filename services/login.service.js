// services/login.service.js
import bcrypt from "bcrypt";
import { getUserByEmail, getEmployeByEmail } from "../models/login.model.js";

export const loginService = async (email, password) => {
  const normEmail = String(email || "").trim().toLowerCase();
  const pwd = String(password || "");
  
  console.log("[AUTH] email saisi:", normEmail);

  // Validation basique avant bcrypt
  if (!normEmail || !pwd) {
    return { error: "Email et mot de passe requis" };
  }

  // =========================
  // ✅ UTILISATEUR (USER)
  // =========================
  const u = await getUserByEmail(normEmail);
  console.log("[AUTH] user trouvé ?", !!u);

  if (u?.password) {
    try {
      const ok = await bcrypt.compare(pwd, u.password);
      console.log("[AUTH] compare USER =", ok);

      if (ok) {
        return {
          id: u.id_user,
          email: u.email,
          role: u.role ?? "USER",
          type: "USER",
          username: u.username ?? null,
          password_temp: !!u.password_temp
        };
      }
    } catch (err) {
      console.error("[AUTH] bcrypt.compare USER error:", err.message);
      // On continue vers employé au lieu de crash
    }
  }

  // =========================
  // ✅ EMPLOYÉ (EMPLOYEE)
  // =========================
  const e = await getEmployeByEmail(normEmail);
  console.log("[AUTH] employé trouvé ?", !!e);

  if (e?.password_hash) {
    try {
      console.log("[AUTH] hash len:", e.password_hash.length);
      const ok = await bcrypt.compare(pwd, e.password_hash);
      console.log("[AUTH] compare EMPLOYEE =", ok, "| pwd length =", pwd.length);

      if (ok) {
        const role = (e.role_employe || "EMPLOYEE").toUpperCase();

        return {
          id: e.id_employe,
          email: e.email_employe,
          role,
          type: "EMPLOYEE",
          username: null,
          password_temp: !!e.password_temp
        };
      }
    } catch (err) {
      console.error("[AUTH] bcrypt.compare EMPLOYEE error:", err.message);
    }
  }

  // =========================
  // ❌ ÉCHEC
  // =========================
  return { error: "Identifiants invalides" };
};