const express = require('express');
const router = express.Router();

const reseniaCalienteController = require('../controllers/resenia_calienteController');

router.get('/',reseniaCalienteController.list);
router.post('/add',reseniaCalienteController.save);

module.exports = router;
