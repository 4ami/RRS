import database from '../models/index.js';
import {v4 as uuidV4} from 'uuid';
import Validator from '../config/validation-schema.js'

const Tables = database.tables;
const Reservation = database.reservations;

const newReservation = async (req, res, next)=> {
    try{

        //decode request body and extract sent data
        const validData = await Validator.reserveSchema.validateAsync(req.body)
        .catch((e)=>{
            let error = new Error("Invalid Data");
            error.status = 422;
            throw error;
        });

        //create reservation id
        const reservationId = uuidV4().substring(0,4);

        // check if there is table has the same id
        const reservation = await Reservation.findOne({attributes: ['reservation_number'] ,where: {reservation_number: reservationId}})
        
        if(reservation){
            let error = new Error("Unexpected Error!\nTry again.");
            error.status = 501;
            throw error;
        }

        //create new reservation
        const create = await Reservation.create({...validData , reservation_number: reservationId});
        
        if(!create){
            let error = new Error("Unexpected Error!");
            error.status = 400;
            throw error;
        }
        //confirm the user reservation and inform the user with its number
        res.status(201).send({reservation_number: reservationId});
    }catch(e){
        if(e.status == 501){next(e);}else {e.message = "Unexpected Error"; next(e.message="Unexpected Error");}
        console.log("Reservation-controller: \nMethod: newReservation-Error.\n" + e.message);
    }
};


const getReservation = async (req,res,next)=>{
    try{
        //validate comming data
        const validData = await Validator.manageSchema.validateAsync(req.body)
        .catch((e)=>{
            let error = new Error("Invalid Data");
            error.status = 422;
            throw error;
        });

        //check if reservation exist
        const reservation = await Reservation.findOne({where: {reservation_number: validData.reservation_id}});
        if(!reservation){
            let er = new Error("Reservation Does Not exist!");
            er.status = 400;
            throw er;
        }
        //join reservation with tables [table] and get table reserved information
        const table = await Tables.findOne({where: {id: reservation.table_id}});
        const result = {
            table,
            reservation
        }
        res.status(200).send(result);
    }catch(e){
        next(e);
        console.log("Reservation-controller: \nMethod: getReservation-Error.\n" + e.message);
    }
};

const deleteReservation = async (req, res, next)=>{
    try{
        //validate comming data
        const validData = await Validator.manageSchema.validateAsync(req.body)
        .catch((e)=>{
            let error = new Error("Invalid Data");
            error.status = 422;
            throw error;
        });

        //check if reservation exist
        const reservation = await Reservation.findOne({where: {reservation_number: validData.reservation_id}});
        if(!reservation){
            let er = new Error("Reservation Does Not exist!");
            er.status = 400;
            throw er;
        }

        // delete the reservation 🤧
        const destroy = await Reservation.destroy({where:{reservation_number: validData.reservation_id}})
        if(!destroy){
            let er = new Error("Unexpected Error!");
            er.status = 500;
            throw er;
        }

        res.status(200).send({response: "Reservation Deleted Successfully"});
    }catch(e){
        next(e);
        console.log("Reservation-controller: \nMethod: deleteReservation-Error.\n" + e.message);
    }
}


const updateReservation = async (req, res, next) => {
    try{
        //validate comming data
        const validData = await Validator.updateReservation.validateAsync(req.body)
        .catch((e)=>{
            let error = new Error("Invalid Data");
            error.status = 422;
            throw error;
        });

        const exist = await Reservation.findOne({where: {reservation_number: validData.reservation_id}});
        if(!exist){
            let er = new Error("Reservation Does Not exist!");
            er.status = 404;
            throw er;
        }

        await Reservation.update(
            {customer_phone: validData.customer_phone, reservation_date: validData.reservation_date, party_size: validData.party_size},
            {where: {reservation_number: validData.reservation_id}}
        );

        res.status(202).send("Update Successfully");
    }catch(e){
        next(e);
        console.log("Reservation-controller: \nMethod: updateeservation-Error.\n" + e.message);
    }
};


export default {newReservation, getReservation, deleteReservation, updateReservation};

