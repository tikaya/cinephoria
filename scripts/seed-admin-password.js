// scripts/seed-admin-password.js
import 'dotenv/config';
import bcrypt from 'bcrypt';
import pool from '../config/db.js';
import { setAdminPasswordIfEmpty } from '../models/admin.model.js';

async function main() {
  const identifier = process.env.ADMIN_IDENTIFIER;
  const plainPwd   = process.env.ADMIN_PLAIN_PWD;

  if (!identifier || !plainPwd) {
    console.error('❌ ADMIN_IDENTIFIER et ADMIN_PLAIN_PWD sont requis dans .env');
    process.exit(1);
  }

  const rounds = Number(process.env.BCRYPT_ROUNDS || 12);
  const passwordHash = await bcrypt.hash(plainPwd, rounds);
  console.log("hash ok?", typeof passwordHash, passwordHash?.length);

  const { status, admin } = await setAdminPasswordIfEmpty({
    username: identifier,
    passwordHash,
  });

  if (status === 'not_found')      console.log(`⚠️ Aucun admin trouvé pour "${identifier}".`);
  else if (status === 'already_set') console.log('ℹ️ Mot de passe admin déjà défini — aucune action.');
  else if (status === 'updated')     console.log(`✅ Mot de passe admin défini pour ${admin.username || admin.email}.`);
}

main().catch(err => {
  console.error('❌ Erreur seed admin password:', err.message);
  process.exit(1);
});
