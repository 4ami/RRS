import express from 'express';
import UserController from '../controllers/user-controller.js';

const router = express.Router();
/**@author:Khalid */
router.post('/sign-up', UserController.signUP);/**@Completed */
router.post('/sign-in', UserController.signIN);/**@Completed */
router.delete('/sign-out', async (req,res)=>{res.status(200).send("signout route");});
router.post('/refresh-token', async (req,res)=>{res.status(200).send("refresh-token route");});

export default router;