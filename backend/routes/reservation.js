import express from 'express';
import reservationController from '../controllers/reservation-controller.js';

const router = express.Router();

// create new reservation
router.post('/new', reservationController.newReservation);
// update reservation
router.post('/get', reservationController.getReservation);
// delete reservation
router.delete('/delete', reservationController.deleteReservation);
// update reservation
router.put('/update',reservationController.updateReservation);

export default router;