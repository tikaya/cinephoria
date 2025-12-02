import express from 'express';
import { requireLogin, requireRole } from '../middlewares/authMiddleware.js';
import * as adminHomeController from '../controllers/admin.home.controller.js';

const router = express.Router();

// Toutes les routes admin → login + rôle ADMIN
router.use(requireLogin, requireRole('ADMIN'));

router.get('/', adminHomeController.index);


export default router;
