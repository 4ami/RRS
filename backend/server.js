import express from 'express';
import bodyParser from 'body-parser';
import morgan from 'morgan';
import authRouter from './routes/auth.js';
import authorize from './helper/token-algorithm.js'
import dotenv from 'dotenv';
import menuRouter from './routes/menu.js';
import tableRouter from './routes/tables.js';

dotenv.config();
const app = express();
app.use(bodyParser.json());
app.use(morgan('dev')); // morgan in development mode

/**
 * @API_ROUTES
 */
app.use('/auth/user', authRouter);
app.use('/menu', menuRouter);
app.use('/tables', tableRouter);

app.get('/', authorize.verifyToken, (req,res)=>{
    res.send(
        {
            auth_bearer: req.headers['authorization'],
            payload: req.payload
        }
    );
});

/**
 * @ERRO_HANDLER
 */
//for undefiend routs this will handle any error
app.use(async(req,res,next)=>{
    const err = new Error("Unexpected error");
    err.status = 404;
    next(err);
});

//error handler return response to the client with error message
app.use((error, req, res, next)=> {
    res.status(error.status || 500);
    res.send(
        {
            error:{
                status: error.status || 500,
                message: error.message
            }
        }
    );
});


app.listen(process.env.PORT,()=>{
    console.log("Server is running on "+process.env.PORT);
    console.log();
});