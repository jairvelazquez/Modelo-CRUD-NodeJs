const express = require('express');
const router = express.Router();

const buscarController = require('../controllers/buscarController');

router.get('/',buscarController.show);
router.post('/buscaPeliculas',buscarController.buscaPeliculas);
router.post('/buscaPersonalidad',buscarController.buscaPersonalidad);
router.post('/buscaUsuario',buscarController.buscaUsuario);
router.post('/buscarPuntuaCaliente',buscarController.buscaPuntuaCaliente);
router.post('/buscarPuntuaEstable',buscarController.buscaPuntuaEstable);
module.exports = router;