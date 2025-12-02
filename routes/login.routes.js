//importons le router d'express
import {Router} from 'express';
import { connectPageController,loginController } from '../controllers/login.contolleur.js';
import { requireLogin } from '../middlewares/authMiddleware.js';
// Creation d'une instance de la classe Router
const loginRouter = Router();

loginRouter.get('/login',connectPageController);

loginRouter.post('/login',loginController);

// Exportons le router au point d'utilisation dans app.js
export default loginRouter;