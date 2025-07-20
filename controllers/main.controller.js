export const renderHome = (req, res) => {
  const films = [];
  res.render('index', { films });
};

export const renderLogin = (req, res) => {
  res.render('login');
};

export const renderReservation = (req, res) => {
  res.render('reservation');
};

export const renderFilms = (req, res) => {
  res.render('films');
};

export const renderContact = (req, res) => {
  res.render('contact');
};
