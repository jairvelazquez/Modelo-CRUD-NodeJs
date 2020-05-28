const express = require('express');
const router = express.Router();

const peliculasController = require('../controllers/peliculaController');

router.get('/',peliculasController.list);



module.exports = router;
