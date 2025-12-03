// tests/salle.helpers.test.js
import {
  assertValidId,
  sanitizeSallePayload,
  validate,
  toLetters
} from "../services/salle.service.js";

/* ============================================================
   TESTS POUR assertValidId()
   ============================================================ */
describe("assertValidId()", () => {

  test("renvoie un nombre entier positif lorsque l’ID est une string numérique", () => {
    expect(assertValidId("5")).toBe(5);
  });

  test("renvoie le nombre tel quel lorsqu’il est déjà un entier", () => {
    expect(assertValidId(10)).toBe(10);
  });

  test("lance une erreur si l’ID est négatif", () => {
    expect(() => assertValidId(-1)).toThrow("ID invalide");
  });

  test("lance une erreur si l’ID n’est pas un nombre valide", () => {
    expect(() => assertValidId("abc")).toThrow("ID invalide");
  });
});


/* ============================================================
   TESTS POUR sanitizeSallePayload()
   ============================================================ */
describe("sanitizeSallePayload()", () => {

  test("nettoie les espaces et convertit les valeurs numériques", () => {
    const result = sanitizeSallePayload({
      nom_salle: "  A  ",
      capacite: "50",
      id_cinema: "3",
      qualite_projection: " 4K "
    });

    expect(result).toEqual({
      nom_salle: "A",
      capacite: 50,
      id_cinema: 3,
      qualite_projection: "4K"
    });
  });

  test("convertit une capacité vide en null", () => {
    const result = sanitizeSallePayload({ capacite: "" });
    expect(result.capacite).toBeNull();
  });

  test("lance une erreur si la capacité < 1", () => {
    expect(() => sanitizeSallePayload({ capacite: 0 })).toThrow("CAPACITE_INVALID");
  });
});


/* ============================================================
   TESTS POUR validate()
   ============================================================ */
describe("validate()", () => {

  test("retourne une erreur si le nom de salle est vide", () => {
    const { errors } = validate({ nom_salle: "", id_cinema: 1 });
    expect(errors.some(e => e.field === "nom_salle")).toBe(true);
  });

  test("retourne une erreur si id_cinema n’est pas un entier positif", () => {
    const { errors } = validate({ nom_salle: "Salle A", id_cinema: "abc" });
    expect(errors.some(e => e.field === "id_cinema")).toBe(true);
  });

  test("retourne une erreur si la capacité est négative", () => {
    const { errors } = validate({ nom_salle: "Salle A", id_cinema: 2, capacite: -5 });
    expect(errors.some(e => e.field === "capacite")).toBe(true);
  });

  test("retourne aucune erreur pour des données valides", () => {
    const { errors, data } = validate({
      nom_salle: "Salle 7",
      id_cinema: 2,
      capacite: 120,
      qualite_projection: "4K"
    });

    expect(errors.length).toBe(0);
    expect(data).toEqual({
      nom_salle: "Salle 7",
      id_cinema: 2,
      capacite: 120,
      qualite_projection: "4K"
    });
  });
});


/* ============================================================
   TESTS POUR toLetters()
   ============================================================ */
describe("toLetters()", () => {

  test("convertit 27 → AA", () => {
    expect(toLetters(27)).toBe("AA");
  });

  test("convertit 1 → A", () => {
    expect(toLetters(1)).toBe("A");
  });

  test("convertit 52 → AZ", () => {
    expect(toLetters(52)).toBe("AZ");
  });

  test("convertit 703 → AAA", () => {
    expect(toLetters(703)).toBe("AAA");
  });
});
