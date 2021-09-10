const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const db = require('@models');

module.exports = () => {
    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    }, async (username, password, done) => {
        try {
            console.log('username: ' + username);
            const usernameCheck = await db.user.findOne({ where: { username }});
            console.log(usernameCheck);
            if(usernameCheck) {
                const passwordCheck = await bcrypt.compare(password, usernameCheck.password);

                if(passwordCheck) {
                    done(null, usernameCheck);
                } else {
                    done(null, false, { msg: 'Password Error' });
                }
            } else {
                done(null, false, { msg: 'ID Error' });
            }
        } catch(e) {
            console.log(e);
            // done(e);
        }
    }));
}