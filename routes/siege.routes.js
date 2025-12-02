import { Router } from "express";
import { renderSiegesPage } from "../controllers/siege.controller.js";

const siegeRouter = Router();

// Page pour afficher le plan des sièges d'une séance
siegeRouter.get("/sieges", renderSiegesPage);

export default siegeRouter;
