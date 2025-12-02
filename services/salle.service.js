// services/salle.service.js

import * as model from '../models/salle.model.js';
import { findAllCinemas } from "../models/cinema.model.js";

/* ------------ Helpers ------------ */
function assertValidId(id) {
  const n = Number(id);
  if (!Number.isFinite(n) || !Number.isInteger(n) || n <= 0) {
    const e = new Error("ID invalide");
    e.userMessage = "ID invalide : entier positif requis.";
    throw e;
  }
  return n;
}

function sanitizeSallePayload(payload = {}) {
  const {
    nom_salle,
    capacite,
    qualite_projection = null,
    id_cinema,
  } = payload;

  const cap =
    capacite === "" || capacite === null || typeof capacite === "undefined"
      ? null
      : Number(capacite);

  if (cap !== null && (!Number.isFinite(cap) || cap < 1)) {
    const e = new Error("CAPACITE_INVALID");
    e.userMessage = "La capacité doit être un entier ≥ 1.";
    throw e;
  }

  const idCinemaNum =
    id_cinema === "" || id_cinema === null || typeof id_cinema === "undefined"
      ? null
      : Number(id_cinema);

  return {
    nom_salle: nom_salle?.trim(),
    capacite: cap,
    qualite_projection: qualite_projection?.trim() || null,
    id_cinema: idCinemaNum,
  };
}

/* ------------ Exports utilisés par le contrôleur ------------ */

// Liste
export async function listSalles() {
  return await findAllSalles();
}

// Détail
export async function getSalle(id) {
  const validId = assertValidId(id);
  return await findSalleById(validId);
}

// Sélecteur de cinémas (pour les formulaires)
export async function getCinemas() {
  return await findAllCinemas();
}

// Création
export async function createSalle(data = {}) {
  const payload = sanitizeSallePayload(data);

  if (!payload.nom_salle || !payload.id_cinema || !payload.capacite) {
    const e = new Error("REQUIRED_FIELDS_MISSING");
    e.userMessage = "nom_salle, id_cinema et capacite sont requis.";
    throw e;
  }

  const newId = await insertSalleRow(payload);
  return newId; // id_salle
}

// Mise à jour
export async function updateSalle(id, data = {}) {
  const validId = assertValidId(id);
  const exists = await findSalleById(validId);
  if (!exists) {
    const e = new Error("SALLE_NOT_FOUND");
    e.userMessage = "Salle introuvable.";
    throw e;
  }

  const payload = sanitizeSallePayload(data);
  const updatedId = await updateSalleRow(validId, payload);
  return updatedId;
}

// Suppression
export async function deleteSalle(id) {
  const validId = assertValidId(id);
  try {
    const deletedId = await deleteSalleRow(validId);
    if (!deletedId) {
      const e = new Error("SALLE_NOT_FOUND");
      e.userMessage = "Salle introuvable.";
      throw e;
    }
    return deletedId;
  } catch (err) {
    // Contrainte FK: des séances existent encore pour cette salle
    if (err.code === "23503") {
      const e = new Error("FK_CONSTRAINT");
      e.userMessage = "Impossible de supprimer : des séances utilisent cette salle.";
      throw e;
    }
    throw err;
  }
}
function validate(input) {
  const errors = [];
  const nom = (input.nom_salle || '').trim();

  // id_cinema OBLIGATOIRE
  const id_cinema = Number(input.id_cinema);
  if (!Number.isInteger(id_cinema) || id_cinema < 1) {
    errors.push({ field: 'id_cinema', message: 'Cinéma obligatoire' });
  }

  let capacite = null;
  if (input.capacite !== null && input.capacite !== undefined && input.capacite !== '') {
    const n = Number(input.capacite);
    if (!Number.isInteger(n) || n < 0) errors.push({ field:'capacite', message:'Capacité doit être un entier ≥ 0' });
    else capacite = n;
  }
  if (!nom) errors.push({ field:'nom_salle', message:'Nom de salle obligatoire' });

  return {
    errors,
    data: { nom_salle: nom, capacite, qualite_projection: input.qualite_projection || null, id_cinema }
  };
}

export async function list({ page=1, q='', cinemaId=null }) {
  const pageSize = 12;
  const offset = (page-1) * pageSize;
  const { rows, total, pageSize: ps } = await model.list({ q, cinemaId, limit: pageSize, offset });
  const cinemas = await findAllCinemas();
  return { rows, total, pageSize: ps, cinemas };
}
export async function create(input) {
  const { errors, data } = validate(input);
  if (errors.length) { const e = new Error('Validation échouée'); e.expose = errors; throw e; }
  return model.insert(data);
}

export async function getById(id) {
  const salle = await model.findById(id);
  if (!salle) return null;
  const [nbSieges, nbSeances] = await Promise.all([model.countSieges(id), model.countSeances(id)]);
  return { ...salle, nb_sieges: nbSieges, nb_seances: nbSeances };
}

export async function update(id, input) {
  const { errors, data } = validate(input);
  if (errors.length) { const e = new Error('Validation échouée'); e.expose = errors; throw e; }
  await model.update(id, data);

  const nbSieges = await model.countSieges(id);
  if (data.capacite !== null && nbSieges !== data.capacite) {
    const e = new Error(`Attention : ${nbSieges} sièges pour une capacité ${data.capacite}. Pensez à générer/ajuster les sièges.`);
    e.expose = [{ field: '_', message: e.message }];
    throw e;
  }
}


export async function remove(id) {
  try {
    await model.remove(id);
  } catch (err) {
    // 23503 FK (séances/sieges)
    if (err.code === '23503') {
      throw new Error('Suppression refusée : des séances ou sièges sont associés à cette salle');
    }
    throw err;
  }
}

function toLetters(n){ let s=''; while(n>0){ const r=(n-1)%26; s=String.fromCharCode(65+r)+s; n=Math.floor((n-1)/26);} return s; }

export async function generateSeatsGrid({ id_salle, rows, cols, wipe=false, pmr_count=0, pmr_mode='none', pmr_list='' }) {
  if (!Number.isInteger(rows) || rows <= 0) throw new Error('Nombre de rangées invalide');
  if (!Number.isInteger(cols) || cols <= 0) throw new Error('Nombre de colonnes invalide');

  const salle = await model.findById(id_salle);
  if (!salle) throw new Error('Salle introuvable');

  if (wipe) await model.deleteSeats(id_salle);
  const existing = await model.countSieges(id_salle);
  if (existing > 0 && !wipe) throw new Error('Des sièges existent déjà. Cochez “Remplacer” pour écraser.');

  // 1) Génération STANDARD
  await model.insertSeatsGrid({ id_salle, rows, cols });

  // 2) PMR
  const n = Math.max(0, Math.min(pmr_count|0, rows*cols));
  if (n > 0 && pmr_mode !== 'none') {
    let numeros = [];
    if (pmr_mode === 'front_block') {
      const row = toLetters(1);
      for (let c=1; c<=Math.min(n, cols); c++) numeros.push(`${row}${c}`);
    } else if (pmr_mode === 'front_sides') {
      const row = toLetters(1);
      let left=1, right=cols;
      while (numeros.length < n && left <= right) {
        numeros.push(`${row}${left}`); if (numeros.length === n) break;
        if (right !== left) numeros.push(`${row}${right}`);
        left++; right--;
      }
    } else if (pmr_mode === 'list') {
      numeros = (pmr_list || '')
        .split(',')
        .map(s => s.trim().toUpperCase())
        .filter(s => /^[A-Z]+[1-9]\d*$/.test(s));
      if (numeros.length === 0) throw new Error('Liste PMR vide ou invalide (ex: A1,A2,B10)');
    }

    if (numeros.length > 0) {
      await model.markSeatsPMRByNumero(id_salle, numeros.slice(0, n));
    }
  }
}
export async function getFormData() {
  const cinemas = await findAllCinemas();
  return { cinemas };
}


