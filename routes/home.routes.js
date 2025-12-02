import { Router } from 'express';
import { homeRender } from '../controllers/home.controller.js';

const homeRouter = Router();

// Route GET sur "/"
homeRouter.get('/', homeRender);

export default homeRouter;
