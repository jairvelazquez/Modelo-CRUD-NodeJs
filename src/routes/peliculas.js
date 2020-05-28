const express = require('express');
const router = express.Router();

const peliculaController = require('../controllers/peliculaController');

router.get('/',peliculaController.list);
router.post('/add', peliculaController.save);
router.get('/update/:id', peliculaController.edit);
router.post('/update/:id', peliculaController.update);
router.get('/delete/:id', peliculaController.delete);
router.post('/addPart', peliculaController.parti);

module.exports = router;