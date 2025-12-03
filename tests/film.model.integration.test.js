import pool from "../config/db.js";
import {
  insert,
  findById,
  update,
  remove,
  list,
  getAllGenres,
  filmFilter
} from "../models/film.model.js";

describe("INTEGRATION FILM MODEL", () => {

  beforeAll(async () => {
    // Nettoyer les tables
    await pool.query("DELETE FROM note");
    await pool.query("DELETE FROM seance");
    await pool.query("DELETE FROM film");
  });



  describe("insert()", () => {
    test("insère un film et retourne son id", async () => {
      const filmId = await insert({
        titre: "Film Test Insert",
        description: "Description du film",
        age_minimum: 12,
        label_coup_de_coeur: true,
        genre: "Action",
        affiche_url: "http://example.com/affiche.jpg"
      });

      expect(filmId).toBeDefined();
      expect(typeof filmId).toBe("number");

      // Nettoyage
      await remove(filmId);
    });
  });

  describe("findById()", () => {
    let filmId;

    beforeAll(async () => {
      filmId = await insert({
        titre: "Film FindById Test",
        description: "Test description",
        genre: "Comédie"
      });
    });

    afterAll(async () => {
      await remove(filmId);
    });

    test("retourne le film si l'id existe", async () => {
      const film = await findById(filmId);

      expect(film).toBeDefined();
      expect(film.titre).toBe("Film FindById Test");
      expect(film.genre).toBe("Comédie");
    });

    test("retourne null si l'id n'existe pas", async () => {
      const film = await findById(99999);

      expect(film).toBeNull();
    });

    test("lance une erreur si l'id est invalide", async () => {
      await expect(findById("abc")).rejects.toThrow("ID de film invalide");
    });
  });

  describe("update()", () => {
    let filmId;

    beforeAll(async () => {
      filmId = await insert({
        titre: "Film Update Test",
        description: "Avant update",
        genre: "Drame"
      });
    });

    afterAll(async () => {
      await remove(filmId);
    });

    test("met à jour un film existant", async () => {
      await update(filmId, {
        titre: "Film Updated",
        description: "Après update",
        genre: "Horreur"
      });

      const film = await findById(filmId);

      expect(film.titre).toBe("Film Updated");
      expect(film.description).toBe("Après update");
      expect(film.genre).toBe("Horreur");
    });
  });

  describe("remove()", () => {
    test("supprime un film existant", async () => {
      const filmId = await insert({
        titre: "Film Remove Test",
        description: "À supprimer",
        genre: "Action"
      });

      await remove(filmId);

      const film = await findById(filmId);
      expect(film).toBeNull();
    });
  });

  describe("list()", () => {
    beforeAll(async () => {
      // Insérer plusieurs films pour tester la liste
      await insert({ titre: "Film Liste A", description: "Test", genre: "Action" });
      await insert({ titre: "Film Liste B", description: "Test", genre: "Comédie" });
      await insert({ titre: "Film Liste C", description: "Test", genre: "Drame" });
    });

    test("retourne une liste de films", async () => {
      const result = await list({});

      expect(result).toHaveProperty("rows");
      expect(result).toHaveProperty("total");
      expect(result).toHaveProperty("pageSize");
      expect(Array.isArray(result.rows)).toBe(true);
    });

    test("filtre par titre avec le paramètre q", async () => {
      const result = await list({ q: "Liste A" });

      expect(result.rows.length).toBeGreaterThanOrEqual(1);
      expect(result.rows[0].titre).toContain("Liste A");
    });

    test("respecte limit et offset", async () => {
      const result = await list({ limit: 2, offset: 0 });

      expect(result.rows.length).toBeLessThanOrEqual(2);
      expect(result.pageSize).toBe(2);
    });
  });

  describe("getAllGenres()", () => {
    test("retourne un tableau de genres distincts", async () => {
      const genres = await getAllGenres();

      expect(Array.isArray(genres)).toBe(true);
      expect(genres.length).toBeGreaterThan(0);
    });
  });

});
