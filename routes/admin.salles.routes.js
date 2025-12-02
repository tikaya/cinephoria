import express from 'express';
import { requireLogin, requireRole } from '../middlewares/authMiddleware.js';
import * as ctrl from '../controllers/admin.salles.controller.js';

const router = express.Router();
router.use(requireLogin, requireRole('ADMIN'));

function ensureNumericId(req, res, next) {
  const id = Number(req.params.id);
  if (Number.isInteger(id) && id >= 1) { req.params.id = id; return next(); }
  return res.redirect('/admin/salles?err=' + encodeURIComponent('ID invalide'));
}

router.get('/', ctrl.list);
router.get('/new', ctrl.renderCreateForm);
router.post('/', ctrl.create);

router.get('/:id/edit', ensureNumericId, ctrl.renderEditForm);
router.post('/:id', ensureNumericId, ctrl.update);
router.post('/:id/delete', ensureNumericId, ctrl.remove);

// “Concevoir” : générer un plan de sièges en grille (rows x cols)
router.post('/:id/generate-seats', ensureNumericId, ctrl.generateSeats);

export default router;
export async function generateSeats(req, res) {
  const id = req.params.id;
  const rows = Number(req.body.rows);
  const cols = Number(req.body.cols);
  const wipe = !!req.body.wipe;

  const pmr_count = Number(req.body.pmr_count || 0);
  const pmr_mode  = (req.body.pmr_mode || 'none').trim();
  const pmr_list  = (req.body.pmr_list || '').trim();

  console.log('[generateSeats]', { id, rows, cols, wipe, pmr_count, pmr_mode, pmr_list });

  try {
    await salleService.generateSeatsGrid({ id_salle: id, rows, cols, wipe, pmr_count, pmr_mode, pmr_list });
    return res.redirect(`/admin/salles/${id}/edit?msg=${encodeURIComponent('Sièges générés')}`);
  } catch (e) {
    console.error('[generateSeats][error]', e);
    return res.redirect(`/admin/salles/${id}/edit?err=${encodeURIComponent(e.message)}`);
  }
}
