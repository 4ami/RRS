import express from 'express';
import reservationController from '../controllers/reservation-controller.js';

const router = express.Router();

// create new reservation
router.post('/new', reservationController.newReservation);
// update reservation
router.post('/get', reservationController.getReservation);
// delete reservation
router.post('/delete', (req, res)=>{});

export default router;