import { Router } from "express";
import {
  renderForcePasswordChange,
  submitForcePasswordChange
} from "../controllers/forcepwd.controller.js";

import { requirePasswordChange } from "../middlewares/authMiddleware.js";

const forcePwdRouter = Router();

// Page obligatoire
forcePwdRouter.get("/force-password-change", requirePasswordChange, renderForcePasswordChange);

// Traitement formulaire
forcePwdRouter.post("/force-password-change", requirePasswordChange, submitForcePasswordChange);

export default forcePwdRouter;
