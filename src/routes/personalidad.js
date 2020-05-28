const express = require('express');
const router = express.Router();

const personalidadController = require('../controllers/personalidadController');

router.get('/', personalidadController.show);
router.post('/delete',personalidadController.delete);

module.exports = router;
