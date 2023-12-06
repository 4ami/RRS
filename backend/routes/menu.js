import express from 'express';
import menuController from '../controllers/menu-controller.js';

const menuRouter = express.Router();

menuRouter.get('/', menuController.getMenuItems);


export default menuRouter;