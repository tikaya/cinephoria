import express from 'express';
import { requireLogin, requireRole } from '../middlewares/authMiddleware.js';
import * as ctrl from '../controllers/admin.seances.controller.js';

const router = express.Router();
router.use(requireLogin, requireRole('ADMIN'));

function ensureNumericId(req, res, next) {
  const id = Number(req.params.id);
  if (Number.isInteger(id) && id >= 1) { req.params.id = id; return next(); }
  return res.redirect('/admin/seances?err=' + encodeURIComponent('ID invalide'));
}

router.get('/', ctrl.list);
router.get('/new', ctrl.renderCreateForm);
router.post('/', ctrl.create);

router.get('/:id/edit', ensureNumericId, ctrl.renderEditForm);
router.post('/:id', ensureNumericId, ctrl.update);
router.post('/:id/delete', ensureNumericId, ctrl.remove);

export default router;
