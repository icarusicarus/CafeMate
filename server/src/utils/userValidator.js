const { check, validationResult } = require('express-validator');

const userValidator = [
    check('userNumber').trim().escape().not().isEmpty().isLength({ max: 60 }).bail(),
    check('kind').isNumeric().trim().escape().not().isEmpty().bail(),
    check('name').trim().escape().not().isEmpty().isLength({ max: 60 }).bail(),
    (req, res, next) => {
        const errors = validationResult(req);
        if(!errors.isEmpty())
            return res.status(500).json({ msg: 'user validator error' });
        next();
    }
];

module.exports = userValidator;