import express from 'express';
import tableController from '../controllers/table-controller.js';
const router = express.Router();

router.get('/', tableController.getAllTables);


export default router;