import Joi from 'joi';

const authSchema = Joi.object({
    username: Joi.string().required().lowercase(),
    
    password: Joi.string().min(2).required(),

    full_name: Joi.string().min(4).required()
});

const authSchemaSignIN = Joi.object({
    username: Joi.string().required().lowercase(),
    password: Joi.string().min(2).required()
});

const reserveSchema = Joi.object({
    customer_phone: Joi.string().required(),
    table_id: Joi.string().required(),
    party_size: Joi.number().required(),
    reservation_date: Joi.date().required()
});

const manageSchema = Joi.object({
    reservation_id: Joi.string().min(4).required()
});

const updateReservation = Joi.object(
    {
        customer_phone: Joi.string().required(),
        reservation_id: Joi.string().required(),
        reservation_date: Joi.string().required(),
        party_size: Joi.number().required()
    }
);

export default { authSchema, authSchemaSignIN , reserveSchema, manageSchema, updateReservation};