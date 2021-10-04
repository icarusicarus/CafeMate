const router = require('express').Router();
const userController = require('@controllers/userController');
const gifticonController = require('@controllers/gifticonController');

const userValidator = require('@utils/userValidator');
const emailValidator = require('@utils/emailValidator');

router.post('/login', userValidator, userController.login);
router.post('/gifticon/update', gifticonController.update);
router.post('/user/email/get', emailValidator, userController.email);

module.exports = router;