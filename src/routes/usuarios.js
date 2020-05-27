const express = require('express');
const router = express.Router();

const usuarioController = require('../controllers/usuarioController');

router.get('/',usuarioController.show);

module.exports = router;
