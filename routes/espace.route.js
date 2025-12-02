import express from "express";
import { getReservationsPage } from "../controllers/espace.controllers.js";
import { requireLogin } from "../middlewares/authMiddleware.js";

const espaceRouter = express.Router();

espaceRouter.get("/commandes",requireLogin,getReservationsPage);

export default espaceRouter;