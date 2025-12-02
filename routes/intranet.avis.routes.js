import { Router } from "express";
import { requireEmployee } from "../middlewares/authMiddleware.js";
import {
  renderAvisList,
  validateAvisController,
  refuseAvisController
} from "../controllers/employe.avis.controller.js";

const avisRouter = Router();

avisRouter.get("/intranet/avis", requireEmployee, renderAvisList);
avisRouter.post("/intranet/avis/:id_note/valider", requireEmployee, validateAvisController);
avisRouter.post("/intranet/avis/:id_note/refuser", requireEmployee, refuseAvisController);

export default avisRouter;
