import {Router} from 'express';
import { requireAdmin } from '../middlewares/authMiddleware.js';
import { renderNew,postCreateEmploye,listEmployes } from '../controllers/admin.employes.js';
import csurf from 'csurf';

const adminEmployeRouter = Router();
const csrfProtection = csurf();

adminEmployeRouter.get('/admin/employes', requireAdmin, listEmployes);  
adminEmployeRouter.get("/admin/employes/new",  requireAdmin, csrfProtection, renderNew);
adminEmployeRouter.post("/admin/employes/new", requireAdmin, csrfProtection, postCreateEmploye);
export default adminEmployeRouter;

;