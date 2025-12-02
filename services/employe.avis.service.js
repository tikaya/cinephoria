import {
  getPendingAvisModel,
  validateAvisModel,
  refuseAvisModel
} from "../models/employe.avis.model.js";

export function getPendingAvisService() {
  return getPendingAvisModel();
}

export function validateAvisService(idNote, idEmploye) {
  return validateAvisModel(idNote, idEmploye);
}

export function refuseAvisService(idNote) {
  return refuseAvisModel(idNote);
}
