const express = require('express');
const router = express.Router();

const personalidadController = require('../controllers/personalidadController');

router.get('/personalidad',personalidadController.list);

module.exports = router;
