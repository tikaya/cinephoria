import express from "express";
import { create } from "../controllers/valide.controller.js";

const Validerouter = express.Router();

// Route pour valider une réservation
Validerouter.post("/valider", create);

export default Validerouter;
