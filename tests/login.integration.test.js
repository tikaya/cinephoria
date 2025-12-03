import request from "supertest";
import app from "../app.js";
import pool from "../config/db.js";
import bcrypt from "bcrypt";

describe("INTEGRATION LOGIN CONTROLLER", () => {

  beforeAll(async () => {
    await pool.query("DELETE FROM utilisateur");

    const hash = await bcrypt.hash("secret123", 10);
    await pool.query(`
      INSERT INTO utilisateur (email, password, role, username, nom_user, prenom_user)
      VALUES ('test@example.com', $1, 'USER', 'toto', 'Test', 'User')
    `, [hash]);
  });



  test("Connexion réussie → redirection vers /", async () => {
    const response = await request(app)
      .post("/login")
      .send({
        email: "test@example.com",
        password: "secret123"
      });

    expect(response.status).toBe(302);
    expect(response.header.location).toBe("/");  // ✅ Corrigé
  });

  test("Mauvais mot de passe → render(login)", async () => {
    const response = await request(app)
      .post("/login")
      .send({
        email: "test@example.com",
        password: "WRONGPASSWORD"
      });

    expect(response.status).toBe(200);
    expect(response.text).toContain("Identifiants invalides");
  });

});