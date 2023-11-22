import bcrypt from 'bcrypt';

const hashing = async (password, next) =>{
    try{
        const salt = await bcrypt.genSalt(10); //number of rounds to hashing password 10 is the default more than 10 makes the response too slow
        const hashedPassword = await bcrypt.hash(password, salt);
        return hashedPassword;
    }catch(error){
        console.log("Hashing error");
        next(error);
    }
};

const validateUser = async (password, hashedPassword)=>{
    try{
        return await bcrypt.compare(password, hashedPassword);
    }catch(err){
        err.status = 404;
        err.message = "Username or Password invalid";
        throw err;
    }
};

export default {hashing, validateUser};