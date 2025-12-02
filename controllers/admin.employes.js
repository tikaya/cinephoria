import { createEmployeService ,listEmployesService } from "../services/admin.employes.js";

export const renderNew = async (req,res) => {
    return res.render('admin/employes/new',{
        title:'Créer un employé',
        actionUrl:'/admin/employes/new',
        backUrl:'/admin/employes',
        error: [],
        old: {email:''},
        csrfToken: req.csrfToken?.() ?? 'null',
        pdwPolicy: {nimLength:8}
        
    });
}

export const postCreateEmploye = async (req, res, next) => {
  try {
    const result = await createEmployeService({
      email: req.body.email,
      password: req.body.password,
      password_confirm: req.body.password_confirm,
      role_employe: req.body.role_employe
    }, { minPwd: 8 });

    if (!result.ok) {
      const status = result.code || 400;
      if (req.accepts("html")) {
        return res.status(status).render("admin/employes/new", {
          title: "Créer un employé",
          actionUrl: "/admin/employes/new",
          backUrl: "/admin/employes",
          error: result.errors,
          old: { email: req.body.email || "" },
          csrfToken: req.csrfToken(),   // regénérer un token
          pdwPolicy: { nimLength: 8 }
        });
      }
      return res.status(status).json(result);
    }

    // succès
    if (req.accepts("html")) return res.redirect("/admin/employes?created=1");
    return res.json({ ok: true, id: result.id });

  } catch (e) { next(e); }
};

export const listEmployes = async (req, res, next) => {
  try {
    const page  = Math.max(1, parseInt(req.query.page || '1', 10));
    const q     = (req.query.q || '').trim() || null;
    const role  = (req.query.role === 'ADMIN' || req.query.role === 'EMPLOYEE') ? req.query.role : null;
    const limit = 20;
    const offset = (page - 1) * limit;

    const { items, total } = await listEmployesService({ limit, offset, q, role });

    return res.render('admin/employes/index', {
      title: 'Employés',
      items,
      page,
      pages: Math.max(1, Math.ceil(total / limit)),
      q,
      role,
      created: req.query.created === '1'
    });
  } catch (e) { next(e); }
};