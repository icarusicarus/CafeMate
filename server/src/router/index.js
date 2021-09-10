const router = require('express').Router();
const userController = require('@controllers/userController');

router.get('/', function(req, res, next) {
    res.json({ title: 'ss'});
});

router.post('/register', userController.register);
router.post('/login', userController.login);

module.exports = router;