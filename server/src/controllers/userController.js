const { validationResult } = require('express-validator');
const passport = require('passport');
const bcrypt = require('bcrypt');
const db = require('@models');

exports.register = async (req, res, next) => {
    try {
        const errors = validationResult(req).array();

        if(errors.length > 0) {
            req.session.errors = errors;
            req.session.success = false;
            res.status(400).json({
                msg: 'Validation errors',
                err: errors
            });
        } else {
            const { username, password, nickname } = req.body;
            const usernameCheck = await db.user.findOne({ where: { username }});

            if(usernameCheck) {
                res.status(400).json({ msg: 'Duplicate username' });
            }

            else {
                const hash = await bcrypt.hash(password, 12);
                await db.user
                .create({
                    username, password: hash, nickname,
                    created_at: new Date().toString(),
                })
                .then(() => {
                    res.status(201).json({ msg:'Register Success' })
                })
                .catch((e) => {
                    res.status(500).json({
                        msg: 'Internal Server Error',
                        err: e
                    });
                });
            }
        }
    } catch(e) {
        return next(e, req, res, next);
    }
};

exports.login = (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        console.log(user);
        if(err) {
            console.log('Login Error');
            // res.status(400).json({ msg: 'Login Error' });
        }
        if(!user) {
            console.log('No ID');
            // res.status(400).json({ msg: 'No ID' });
        }

        req.login(user, (err) => {
            if(err) {
                console.log('Login Fail');
                // res.status(400).json({ msg: 'Login Fail' });
            }
            else {
                console.log('Login Success');
                // res.status(500).json({ msg: 'Login Success' });
            }
        })
    }) (req, res, next);
}