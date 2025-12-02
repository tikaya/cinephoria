import * as seanceService from '../services/seance.service.js';
import * as cinemaModel from '../models/cinema.model.js';

export async function list(req, res) {
  const page = Math.max(parseInt(req.query.page || '1', 10), 1);
  const filters = {
    film: (req.query.film || '').trim(),
    salle: (req.query.salle || '').trim(),
    date: (req.query.date || '').trim()
  };

  const { rows, total, pageSize, films, salles } =
    await seanceService.list({ page, ...filters });

  return res.render('admin/seances/list', {
    title: 'Séances',
    seances: rows,
    total,
    page,
    pageSize,
    filters,
    films,
    salles,
    msg: req.query.msg || null,
    err: req.query.err || null
  });
}

export async function renderCreateForm(req, res) {
  const data = await seanceService.getFormData();
  const cinemas = await cinemaModel.getAllCinemas();
  return res.render('admin/seances/new', {
    title: 'Nouvelle séance',
    errors: null,
    old: {},
    films: data.films,
    salles: data.salles,
    cinemas
  });
}

export async function create(req, res) {
  const b = req.body || {};
  try {
    await seanceService.create({
      id_film: b.id_film,
      id_cinema: b.id_cinema,
      id_salle: b.id_salle,
      date_seance: b.date_seance,
      heure_debut: b.heure_debut,
      heure_fin: b.heure_fin,
      prix: b.prix,
      qualite_projection: (b.qualite_projection ?? '').trim() || null
    });

    return res.redirect(`/admin/seances?msg=${encodeURIComponent("Séance créée")}`);
  } catch (e) {
    const data = await seanceService.getFormData();
    const cinemas = await cinemaModel.getAllCinemas();

    return res.status(400).render('admin/seances/new', {
      title: 'Nouvelle séance',
      errors: e.expose || [{ field: '_', message: e.message }],
      old: req.body,
      films: data.films,
      salles: data.salles,
      cinemas
    });
  }
}

export async function renderEditForm(req, res) {
  const id = req.params.id;
  const seance = await seanceService.getById(id);
  if (!seance) {
    return res.redirect(`/admin/seances?err=${encodeURIComponent("Séance introuvable")}`);
  }

  const data = await seanceService.getFormData();
  const cinemas = await cinemaModel.getAllCinemas();

  return res.render('admin/seances/edit', {
    title: 'Éditer séance',
    seance,
    errors: null,
    films: data.films,
    salles: data.salles,
    cinemas
  });
}

export async function update(req, res) {
  const id = req.params.id;
  try {
    await seanceService.update(id, {
      id_film: req.body.id_film,
      id_cinema: req.body.id_cinema,
      id_salle: req.body.id_salle,
      date_seance: req.body.date_seance,
      heure_debut: req.body.heure_debut,
      heure_fin: req.body.heure_fin,
      prix: req.body.prix,
      qualite_projection: (req.body.qualite_projection ?? '').trim() || null
    });

    return res.redirect(`/admin/seances?msg=${encodeURIComponent("Séance mise à jour")}`);
  } catch (e) {
    const data = await seanceService.getFormData();
    const seance = await seanceService.getById(id);
    const cinemas = await cinemaModel.getAllCinemas();

    return res.status(400).render('admin/seances/edit', {
      title: 'Éditer séance',
      seance: { ...seance, ...req.body, id_seance: id },
      errors: e.expose || [{ field: '_', message: e.message }],
      films: data.films,
      salles: data.salles,
      cinemas
    });
  }
}

export async function remove(req, res) {
  const id = req.params.id;
  try {
    await seanceService.remove(id);
    return res.redirect(`/admin/seances?msg=${encodeURIComponent("Séance supprimée")}`);
  } catch (e) {
    return res.redirect(`/admin/seances?err=${encodeURIComponent(e.message)}`);
  }
}
