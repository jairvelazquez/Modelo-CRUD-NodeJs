const express = require('express');
const router = express.Router();

const personalidadController = require('../controllers/personalidadController');

router.get('/',personalidadController.list);
router.get('/participaciones',personalidadController.list1);
router.post('/addGui', personalidadController.proc1);
router.post('/addDir', personalidadController.proc2);
router.post('/addAct', personalidadController.proc3);
router.get('/update/:id', personalidadController.edit);
router.post('/update/:id', personalidadController.update);
router.get('/delete/:id', personalidadController.delete);



module.exports = router;

