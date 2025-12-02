import { Router } from "express";
import { renderFormForgetPwd, submitForgetPwd } from "../controllers/forgetpwd.controller.js";

const router = Router();

// ✅ Page publique
router.get("/forgot-password", renderFormForgetPwd);

// ✅ Envoi mail + génération mot de passe
router.post("/forgot-password", submitForgetPwd);

export default router;
