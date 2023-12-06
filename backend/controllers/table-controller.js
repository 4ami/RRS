import database from "../models/index.js";

/// * [connect to database and use {Menu Table}]
const Tables = database.tables;

/**
 * @GET_ALL_TABLES
 */

const getAllTables = async (req, res, next) =>{
    try{
        //Get All tables from DB
        const tables = await Tables.findAll();

        //Check if there is no tables throw error
        if(!tables){
            let error = new Error("Table reservation isn't avaialable at this moment!");
            error.status = 404;
            throw error;
        }
        
        //Create object from Date -> to generate current request date
        // const date = new Date();
        // NowDate: `${date.getFullYear()}/${date.getMonth()+1}/${date.getDate()} ${date.getHours()}:${date.getMinutes()}`}
        //Successful request will return response with all tables with OK! status
        res.send(tables).status(200);
    }catch(err){
        console.log("Table-Controller:\nMethod: getAllTables-Error.\n" + err.message);
        next(err);
    }
};


export default {getAllTables};