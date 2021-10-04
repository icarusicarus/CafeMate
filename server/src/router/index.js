const router = require('express').Router();
const userController = require('@controllers/userController');
const gifticonController = require('@controllers/gifticonController');
const userValidator = require('@utils/userValidator');

router.post('/login', userValidator, userController.login);
router.post('/gifticon/update', gifticonController.update);

module.exports = router;