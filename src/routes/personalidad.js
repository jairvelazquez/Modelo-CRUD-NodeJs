const express = require('express');
const router = express.Router();

const personalidadController = require('../controllers/personalidadController');

router.get('/',personalidadController.list);
router.post('/add', personalidadController.save);
router.get('/update/:id', personalidadController.edit);
router.post('/update/:id', personalidadController.update);
router.get('/delete/:id', personalidadController.delete);

module.exports = router;

