import * as filmService from '../services/film.service.js';

export async function list(req, res) {
  const page = Math.max(parseInt(req.query.page || '1', 10), 1);
  const q = (req.query.q || '').trim();
  const { rows, total, pageSize } = await filmService.list({ page, q });
  return res.render('admin/films/list', {
    title: 'Films', films: rows, total, page, pageSize, q,
    msg: req.query.msg || null, err: req.query.err || null
  });
}

export async function renderCreateForm(req, res) {
  return res.render('admin/films/new', { title: 'Nouveau film', errors: null, old: {} });
}

export async function create(req, res) {
  const b = req.body || {};
  const payload = {
    titre: (b.titre ?? '').trim(),
    description: (b.description ?? '').trim(),
    genre: (b.genre ?? '').trim(),
    age_minimum: (b.age_minimum === '' || b.age_minimum == null) ? null : b.age_minimum,
    label_coup_de_coeur: !!b.label_coup_de_coeur,
    affiche_url: (b.affiche_url ?? '').trim() || null
  };
  try {
    await filmService.create(payload);
    return res.redirect(`/admin/films?msg=${encodeURIComponent('Film créé')}`);
  } catch (e) {
    return res.status(400).render('admin/films/new', {
      title: 'Nouveau film',
      errors: e.expose || [{ field: '_', message: e.message }],
      old: b
    });
  }
}

export async function renderEditForm(req, res) {
  const id = req.params.id; // déjà numérique via ensureNumericId
  const film = await filmService.getById(id);
  if (!film) return res.redirect(`/admin/films?err=${encodeURIComponent('Film introuvable')}`);
  return res.render('admin/films/edit', { title: 'Éditer film', film, errors: null });
}

export async function update(req, res) {
  const id = req.params.id;
  try {
    await filmService.update(id, {
      titre: (req.body.titre ?? '').trim(),
      description: (req.body.description ?? '').trim(),
      genre: (req.body.genre ?? '').trim(),
      age_minimum: (req.body.age_minimum === '' || req.body.age_minimum == null) ? null : req.body.age_minimum,
      label_coup_de_coeur: !!req.body.label_coup_de_coeur,
      affiche_url: (req.body.affiche_url ?? '').trim() || null
    });
    return res.redirect(`/admin/films?msg=${encodeURIComponent('Film mis à jour')}`);
  } catch (e) {
    const film = await filmService.getById(id);
    return res.status(400).render('admin/films/edit', {
      title: 'Éditer film',
      film: { ...film, ...req.body, id_film: id },
      errors: e.expose || [{ field: '_', message: e.message }]
    });
  }
}

export async function remove(req, res) {
  const id = req.params.id;
  try {
    await filmService.remove(id);
    return res.redirect(`/admin/films?msg=${encodeURIComponent('Film supprimé')}`);
  } catch (e) {
    return res.redirect(`/admin/films?err=${encodeURIComponent(e.message)}`);
  }
}

// 👉 Export par défaut en plus des nommés (compat multi-import)
export default { list, renderCreateForm, create, renderEditForm, update, remove };
