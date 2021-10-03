const router = require('express').Router();
const userController = require('@controllers/userController');
const userValidator = require('@utils/userValidator')

router.post('/login', userValidator, userController.login);

module.exports = router;