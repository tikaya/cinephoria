import { Router } from "express";
import { renderRecapitulatif } from "../controllers/recapitulatif.controller.js";
import { requireLogin } from "../middlewares/authMiddleware.js";
const recapitulatifRouter = Router();

// GET /recapitulatif?seanceId=XX&nbrPlaces=XX&cinemaId=XX&filmId=XX
recapitulatifRouter.get("/recapitulatif", renderRecapitulatif);


export default recapitulatifRouter;
