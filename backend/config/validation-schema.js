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

const menuSchema = [];

export default { authSchema, authSchemaSignIN , menuSchema };