const passport = require('passport');
const local = require('@utils/passport/local');
// const kakao = require('@utils/passport/kakao');

module.exports = () => {
passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser((id, done) => {
    done(null, user);
});

local();
// kakao();

}