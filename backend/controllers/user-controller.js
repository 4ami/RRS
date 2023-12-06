import database from '../models/index.js';
import hashing from '../helper/hashing-algorithm.js'
import tokens from '../helper/token-algorithm.js';
import Validator from '../config/validation-schema.js'
//Connect to Database and use only Users table
const User = database.users;

//sign-up new user
const signUP = async (req, res, next)=>{
    //decode request body and extract user data
    try{
        //validate request data
        const vUserData = await Validator.authSchema.validateAsync(req.body)
        .catch((err) =>{
            let error = new Error("Unexpected Error");
            error.status = 422;
            throw error;
        });

        // check if username is already exist in the database
        const user = await User.findOne({attributes: ['username'], where: { username: vUserData.username } });
        if(user){
            let error =  new Error("Username is already exist!");
            error.status = 409;
            throw error;
        } 

        //hashing password 
        const hashedPassword = await hashing.hashing(vUserData.password, next);
    
        //replace user's password with hashed password 
        vUserData.password = hashedPassword;
        
        //generate user access token
        const accessToken = await tokens.generateJWT(vUserData.username);

        //register user info in database
        const register = await User.create({...vUserData, role:"customer", privileges:"view, update"});

        //if something wrong happend with create new user in database
        if(!register){
            let error = new Error("Unexpected Error");
            error.status = 400;
            throw error;
        }
        //return ok response with user access token
        res.status(201).send({accessToken});
    }catch(er){
        console.log("SignUP-controller catches: \n"+er.message);
        next(er);
    }
};

//sign-in existing user
const signIN = async (req, res, next)=>{
    try{
        //validate SQLI and XSS
        const vUserData = await Validator.authSchemaSignIN.validateAsync(req.body)
        .catch(err => {
            let error = new Error("Unexpected Error");
            error.status = 422;
            throw error;
        });

        //find if user is already exist
        const user = await User.findOne({
            attributes: ['username', 'password'], //only return those two columns
            where: { username: vUserData.username } //query condition [username = 'userData.username']
        });

        if(!user){
            let error = new Error("username or password invalid");
            error.status = 404;
            throw error;
        }

        //compare user password with hashed password
        const isValid = await hashing.validateUser(vUserData.password, user.password);

        if(!isValid){
            let err = new Error("Username or Password invalid");
            err.status = 401;
            throw err;
        }

        //return user's token
        const accessToken = await tokens.generateJWT(user.username);
        res.status(200).send({accessToken});
    }catch(er){
        console.log(er.name);
        next(er);
    }
};

export default {signUP , signIN};