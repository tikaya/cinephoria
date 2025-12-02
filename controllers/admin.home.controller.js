import * as adminStats from '../services/admin.stats.service.js';

export async function index(req, res) {
  const stats = await adminStats.getCounts().catch(() => ({}));
  return res.render('admin/index', { title: 'Administration', stats });
}
