import express from 'express';
import { requireLogin, requireRole } from '../middlewares/authMiddleware.js';

// ⚠️ Chemin EXACT (casse Linux) : controllers/admin.films.controller.js
import filmsCtrlMod from '../controllers/admin.films.controller.js';

const router = express.Router();
router.use(requireLogin, requireRole('ADMIN'));

// ——— Résolution robuste des handlers (default OU nommés) ———
const mod = filmsCtrlMod || {};
const ctrl = {
  list:               mod.list               || mod.default?.list,
  renderCreateForm:   mod.renderCreateForm   || mod.default?.renderCreateForm,
  create:             mod.create             || mod.default?.create,
  renderEditForm:     mod.renderEditForm     || mod.default?.renderEditForm,
  update:             mod.update             || mod.default?.update,
  remove:             mod.remove             || mod.default?.remove,
};

// Dev helper : s’assure que chaque handler est bien une fonction
function mustBeFn(fn, name) {
  if (typeof fn !== 'function') {
    const exported = Object.keys(mod).concat(Object.keys(mod.default || {}));
    throw new Error(`[admin.films.routes] Handler "${name}" introuvable. Exports trouvés: ${JSON.stringify(exported)}`);
  }
  return fn;
}

// Garde ID numérique
function ensureNumericId(req, res, next) {
  const id = Number(req.params.id);
  if (Number.isInteger(id) && id >= 1) { req.params.id = id; return next(); }
  // fallback si tu n'as pas encore la vue 404
  return res.redirect('/admin/films?err=' + encodeURIComponent('ID invalide'));
}

// IMPORTANT : '/new' AVANT '/:id'
router.get('/',               mustBeFn(ctrl.list, 'list'));
router.get('/new',            mustBeFn(ctrl.renderCreateForm, 'renderCreateForm'));
router.post('/',              mustBeFn(ctrl.create, 'create'));

router.get('/:id/edit',       ensureNumericId, mustBeFn(ctrl.renderEditForm, 'renderEditForm'));
router.post('/:id',           ensureNumericId, mustBeFn(ctrl.update, 'update'));
router.post('/:id/delete',    ensureNumericId, mustBeFn(ctrl.remove, 'remove'));

export default router;
