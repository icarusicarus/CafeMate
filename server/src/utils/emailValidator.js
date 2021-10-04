const { check, validationResult } = require('express-validator');

const emailValidator = [
    check('email').trim().escape().not().isEmpty().isEmail().bail(),
    (req, res, next) => {
        const errors = validationResult(req);
        if(!errors.isEmpty())
            return res.status(400).json({ msg: 'email validator error' });
        next();
    }
];

module.exports = emailValidator;