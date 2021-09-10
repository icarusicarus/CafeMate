const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const db = require('@models');

module.exports = () => {
    passport.use(new LocalStrategy({
        usernameField: 'user_id',
        passwordField: 'password'
    }, async (user_id, password, done) => {
        try {
            const userIdCheck = await db.user.findOne({ where: { user_id } });
            if(userIdCheck) {
                const passwordCheck = await bcrypt.compare(password, userIdCheck.password);

                if(passwordCheck) {
                    done(null, userIdCheck, 'Login Success');
                } else {
                    done(null, false, 'Password Error');
                }
            } else {
                done(null, false, 'ID Error');
            }
        } catch(e) {
            done(e);
        }
    }));
}