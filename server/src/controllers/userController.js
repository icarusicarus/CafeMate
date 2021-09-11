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
            const { user_id, password, nickname } = req.body;
            const userIdCheck = await db.user.findOne({ where: { user_id }});

            if(userIdCheck) {
                res.status(400).json({ msg: 'Duplicate user id' });
            }

            else {
                const saltRound = 10;
                bcrypt
                .genSalt(saltRound)
                .then(salt=> {
                    return bcrypt.hash(password, salt);
                })
                .then(async (hash) => {
                    await db.user
                    .create({
                        user_id, password: hash, nickname,
                        created_at: new Date().toString(),
                    })
                    .then(() => {
                        res.status(200).json({ msg:'Register Success', hash: hash })
                    })
                    .catch((_) => {
                        res.status(500).json({ msg: 'Register Fail' });
                    });
                });
            }
        }
    } catch(e) {
        return next(e, req, res, next);
    }
};

exports.login = (req, res, next) => {
    passport.authenticate('local', (_, user, info) => {
        req.login(user, (err) => {
            if(err) {
                res.status(400).json({ msg: info });
            }
            else {
                console.log(info);
                res.status(200).json({ msg: info });
            }
        });
    }) (req, res, next);
}