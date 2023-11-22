import jwt from 'jsonwebtoken';

const generateJWT = (username)=> {
    return new Promise((resolve, reject)=>{
        const paylod = {};

        const secret = process.env.SECRET_KEY;

        const option = {
            expiresIn: "7h",
            issuer: "Fancy Restaurant",
            audience: username
        };

        jwt.sign(paylod, secret, option, (err, token)=>{
            if(err) reject(new Error("Oops! Something goes worng!"));
            resolve(token);
        });
    });
};

const verifyToken = (req, res, next)=>{
    try{
        if(!req.headers['authorization']){
            let error = new Error("Unauthorized!");
            error.status = 401;
            throw error;
        }
    
        const authHeader = req.headers['authorization']; //get authorization header
        const bearerToken = authHeader.split(' '); // authorization header contains [bearer token] in this form, so we split them
        const accessToke = bearerToken[1]; //get the token
    
        jwt.verify(accessToke, process.env.SECRET_KEY, (error, payload) => {
            if(error){
                const message = error.message === 'JsonWebTokenError' ? 'Unauthorized!' : error.message;
                let err = new Error(message);
                err.status = 401;
                throw err;

            }
            req.payload = payload;
            next();
        });
    }catch(err){
        next(err);
    }
};

export default {generateJWT, verifyToken}; 