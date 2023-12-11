import express from 'express';
import tableController from '../controllers/table-controller.js';
const router = express.Router();

// router.get('/', tableController.getAllTables);
router.get('/', tableController.test);

export default router;