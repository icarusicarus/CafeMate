const passport = require('passport');
const local = require('@utils/passport/local');

module.exports = () => {
    passport.serializeUser((user, done) => {
        done(null, user.id);
    });

    passport.deserializeUser((user, done) => {
        done(null, user);
    });

    local();
}