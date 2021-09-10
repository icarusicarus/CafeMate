const auth = (req, res, next) => {
    if (req.isAuthenticated()) {
      return next();
    }
    return res.status(400).json({ code: 41, data: { msg: 'not authenticated', err: 'not authenticated' }});
  };
  
  module.exports = auth;