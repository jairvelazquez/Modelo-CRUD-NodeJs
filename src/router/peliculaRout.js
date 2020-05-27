const express = rquire('express');
const router = express.Router();

const peliculasController = require('../controllers/peliculasController');

router.get('/', peliculasController.list);
router.post('/add', peliculasController.save);
router.get('/delete/:id', peliculasController.delete);

router.get('/update/:id', peliculasController.edit);
router.post('/update/:id', peliculasController.update);
 module.exports = router;