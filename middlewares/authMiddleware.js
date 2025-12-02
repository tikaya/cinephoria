// Middlewares d'auth & rôle (compatible req.user ou req.session.user)
function getAuthUser(req) {
  return req.user || req.session?.user || null;
}

// helpers/auth.js (facultatif)
function wantsJSON(req) {
  // xhr, fetch/axios JSON, ou Accept qui préfère JSON
  return req.xhr
    || req.get('X-Requested-With') === 'XMLHttpRequest'
    || req.is('application/json')
    || (req.accepts(['html','json']) === 'json');
}

export function requireLogin(req, res, next) {
  const user = getAuthUser(req);
  if (user) return next();

  const redirectUrl = encodeURIComponent(req.originalUrl || "/");
  return res.redirect(`/login?redirect=${redirectUrl}`);
}


export function requireRole(...roles) {
  return (req, res, next) => {
    const user = getAuthUser(req);
    if (!user) {
      const nextUrl = encodeURIComponent(req.originalUrl || '/');
      return res.redirect(`/login?next=${nextUrl}`);
    }
    if (!roles.includes(user.role)) {
      // 403 + page dédiée si tu veux
      return res.status(403).render('errors/403', { title: 'Accès refusé', user });
    }
    return next();
  };
}

// Rend currentUser dispo dans EJS (header, etc.)
export function exposeUserToViews(req, res, next) {
  res.locals.currentUser = getAuthUser(req);
  next();
}


export function requireAdmin(req, res, next) {
  const user = getAuthUser(req);

  // 1) Pas connecté
  if (!user) {
    const back = encodeURIComponent(req.originalUrl || '/');
    if (wantsJSON(req)) {
      return res.status(401).json({
        error: 'unauthenticated',
        message: 'Connexion requise',
        redirect: `/login?redirect=${back}`
      });
    }
    return res.redirect(`/login?redirect=${back}`);
  }

  // 2) Connecté mais pas ADMIN
  if (user.role !== 'ADMIN') {
    if (wantsJSON(req)) {
      return res.status(403).json({
        error: 'forbidden',
        message: 'Accès refusé — réservé aux administrateurs.'
      });
    }
    return res.status(403).render('errors/403', {
      title: 'Accès refusé',
      message: 'Cette section est réservée aux administrateurs.',
      backUrl: req.get('referer') || '/'
    });
  }

  // 3) OK
  return next();
}


export function requireEmployee(req,res,next) {
  const u = req.session?.user;
   const role = String(u?.role || u?.type || "").toUpperCase();
   if (u && (role === "EMPLOYEE" || role === "EMPLOYE" || role === "ADMIN")) {
    return next();
  }

   // si pas connecté ou mauvais rôle
  return res.redirect("/login?redirect=" + encodeURIComponent(req.originalUrl));
}


export const requirePasswordChange = (req, res, next) => {
  if (!req.session.tempUser) {
    return res.redirect("/login");
  }
  next();
};
