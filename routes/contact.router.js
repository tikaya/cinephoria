import { Router } from "express";
import {
  renderContactPage,
  submitContactForm
} from "../controllers/contact.controller.js";

const contactRouter = Router();

// Page formulaire
contactRouter.get("/contact", renderContactPage);

// Envoi message
contactRouter.post("/contact", submitContactForm);

export default contactRouter;
