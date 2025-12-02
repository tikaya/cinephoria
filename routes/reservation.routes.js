import { Router } from "express";
import { renderReservationPage, renderSeancesPage } from "../controllers/reservation.controller.js";

const reservationRouter = Router();

reservationRouter.get("/reservation", renderReservationPage);
reservationRouter.get("/seances", renderSeancesPage);

export default reservationRouter;
