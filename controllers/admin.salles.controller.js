import * as salleService from '../services/salle.service.js';

export async function list(req, res) {
  const page = Math.max(parseInt(req.query.page || '1', 10), 1);
  const q = (req.query.q || '').trim();
  const cinemaId = req.query.cinemaId ? Number(req.query.cinemaId) : null;

  const { rows, total, pageSize, cinemas } = await salleService.list({ page, q, cinemaId });

  return res.render('admin/salles/list', {
    title: 'Salles', salles: rows, total, page, pageSize, q, cinemaId,
    cinemas,
    msg: req.query.msg || null, err: req.query.err || null
  });
}

export async function renderCreateForm(req, res) {
  const fd = await salleService.getFormData();
  return res.render('admin/salles/new', { title: 'Nouvelle salle', errors: null, old: {}, cinemas: fd.cinemas });
}


export async function create(req, res) {
  const b = req.body || {};
  try {
    await salleService.create({
      nom_salle: (b.nom_salle ?? '').trim(),
      capacite: (b.capacite === '' ? null : b.capacite),
      qualite_projection: (b.qualite_projection ?? '').trim() || null,
      id_cinema: b.id_cinema
    });
    return res.redirect(`/admin/salles?msg=${encodeURIComponent('Salle créée')}`);
  } catch (e) {
    const fd = await salleService.getFormData();
    return res.status(400).render('admin/salles/new', {
      title: 'Nouvelle salle', errors: e.expose || [{ field: '_', message: e.message }], old: req.body, cinemas: fd.cinemas
    });
  }
}

export async function renderEditForm(req, res) {
  const id = req.params.id;
  const salle = await salleService.getById(id);
  if (!salle) return res.redirect(`/admin/salles?err=${encodeURIComponent('Salle introuvable')}`);
  const fd = await salleService.getFormData();
  return res.render('admin/salles/edit', { title: 'Éditer salle', salle, errors: null, cinemas: fd.cinemas });
}
export async function update(req, res) {
  const id = req.params.id;
  try {
    await salleService.update(id, {
      nom_salle: (req.body.nom_salle ?? '').trim(),
      capacite: (req.body.capacite === '' ? null : req.body.capacite),
      qualite_projection: (req.body.qualite_projection ?? '').trim() || null,
      id_cinema: req.body.id_cinema
    });
    return res.redirect(`/admin/salles?msg=${encodeURIComponent('Salle mise à jour')}`);
  } catch (e) {
    const fd = await salleService.getFormData();
    const salle = await salleService.getById(id);
    return res.status(400).render('admin/salles/edit', {
      title: 'Éditer salle',
      salle: { ...salle, ...req.body, id_salle: id },
      errors: e.expose || [{ field: '_', message: e.message }],
      cinemas: fd.cinemas
    });
  }
}

export async function remove(req, res) {
  const id = req.params.id;
  try {
    await salleService.remove(id);
    return res.redirect(`/admin/salles?msg=${encodeURIComponent('Salle supprimée')}`);
  } catch (e) {
    return res.redirect(`/admin/salles?err=${encodeURIComponent(e.message)}`);
  }
}

export async function generateSeats(req, res) {
  const id   = req.params.id;
  const rows = Number(req.body.rows);
  const cols = Number(req.body.cols);
  const wipe = !!req.body.wipe;

  // ✅ AJOUTE CES LIGNES
  const pmr_count = Number(req.body.pmr_count || 0);
  const pmr_mode  = (req.body.pmr_mode || 'none').trim();
  const pmr_list  = (req.body.pmr_list || '').trim();

  console.log('[generateSeats]', { id, rows, cols, wipe, pmr_count, pmr_mode, pmr_list });

  try {
    // ✅ ET PASSE-LES AU SERVICE
    await salleService.generateSeatsGrid({
      id_salle: id, rows, cols, wipe,
      pmr_count, pmr_mode, pmr_list
    });
    return res.redirect(`/admin/salles/${id}/edit?msg=${encodeURIComponent('Sièges générés')}`);
  } catch (e) {
    console.error('[generateSeats][error]', e);
    return res.redirect(`/admin/salles/${id}/edit?err=${encodeURIComponent(e.message)}`);
  }
}