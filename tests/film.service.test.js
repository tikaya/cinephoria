import { validate } from "../services/film.service.js";
import { generatePassword } from "../services/forgetpwd.service.js";

/* ============================================================
   TESTS POUR validate() — Service Film
   ============================================================ */
describe("validate() — Film service", () => {

  test("accepte des données valides (aucune erreur)", () => {
    const input = {
      titre: "Inception",
      description: "A mind-bending thriller",
      genre: "Sci-Fi",
      age_minimum: 13
    };

    const result = validate(input);

    expect(result.errors.length).toBe(0);
    expect(result.data.titre).toBe("Inception");
    expect(result.data.genre).toBe("Sci-Fi");
  });

  test("retourne une erreur si le titre est vide", () => {
    const result = validate({
      titre: "",
      description: "desc",
      genre: "Action",
      age_minimum: 12
    });

    expect(result.errors.some(e => e.field === "titre")).toBe(true);
  });

  test("retourne une erreur si l'âge minimum est négatif", () => {
    const result = validate({
      titre: "Test",
      description: "desc",
      genre: "Aventure",
      age_minimum: -3
    });

    expect(result.errors.some(e => e.field === "age_minimum")).toBe(true);
  });
});


/* ============================================================
   TESTS POUR generatePassword()
   ============================================================ */
describe("generatePassword()", () => {

  test("génère un mot de passe de 10 caractères", () => {
    const pwd = generatePassword();
    expect(typeof pwd).toBe("string");
    expect(pwd.length).toBe(10);
  });

  test("génère un mot de passe différent à chaque appel (probabilité haute)", () => {
    const pwd1 = generatePassword();
    const pwd2 = generatePassword();

    // Ce test n'est pas parfait mais utile pour détecter un bug grossier
    expect(pwd1).not.toBe(pwd2);
  });

  test("n’utilise que des caractères autorisés", () => {
    const allowed = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789@#";
    const pwd = generatePassword();

    for (const char of pwd) {
      expect(allowed.includes(char)).toBe(true);
    }
  });
});
