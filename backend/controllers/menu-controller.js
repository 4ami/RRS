import database from "../models/index.js";

/// * [connect to database and use {Menu Table}]
const Menu = database.menu;

/**
 * @Get_ALL_Menu_Items
 */
const getMenuItems = async (req, res, next)=>{
    try{
        //get all menu Items
        const items = await Menu.findAll();

        //check whether the values are null
        if(!items){
            let error = new Error("Menu service isn't available at this moment!");
            error.status = 404;
            throw error;
        }

        //send menu items with OK! status
        res.send(items).status(200);
    }catch(er){
        console.log("Menu-Controller:\nMethod: getMenuItems-Error.\n"+er.message);
        next(er);
    }
};

export default {getMenuItems};