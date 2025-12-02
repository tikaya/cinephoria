import { jest } from '@jest/globals';

// MOCK DE MODULE EN ESM : utilise un module de mock séparé
const queryMock = jest.fn();

jest.unstable_mockModule("../config/db.js", () => ({
  default: { query: queryMock }
}));

import { getUserByEmail } from "../models/login.model.js";
import pool from "../config/db.js";

test('Retourne un user si email existe en base de données', async () => {
    queryMock.mockResolvedValueOnce({ rows: [ { email: "Denis_Block@yahoo.com" } ] });
    const user = await getUserByEmail("Denis_Block@yahoo.com");
    expect(user).toEqual(expect.objectContaining({ email: "Denis_Block@yahoo.com" }));
});

test('Retourne null si email n\'existe pas en base de données', async () => {
    queryMock.mockResolvedValueOnce({ rows: [] });
    const user = await getUserByEmail("yuyu@gmail.com");
    expect(user).toBeNull();
});
