import db_config from '../config/db-config.js';
import { Sequelize, DataTypes } from 'sequelize';
import UserModel from '../models/user-model.js';
// import MenuModel from '../models/menu-model.js';

//get all database information -> sequelize it
const sequelize = new Sequelize(
    db_config.database,
    db_config.user,
    db_config.password,
    {
        host: process.env.HOST,
        dialect: db_config.dialect,
        operatorAliases:false,
        pool: {
            max: db_config.pool.max,
            min: db_config.pool.min,
            acquire: db_config.pool.acquire,
            idle: db_config.pool.idle
        },
        logging: false //stop logs messeges from showing
    }
);

//authenticate database user and password 
sequelize.authenticate()
        .then(()=>{
        console.log("success"); // if authentication success inform me or do some logic
        })
        .catch((error)=>{
        console.log("models/index.js: error line 30"); // if authentication is denied inform me
        });

const database = {};

database.Sequelize = Sequelize;
database.sequelize = sequelize;

//when operation need to users table then it will use user-model
database.users = UserModel(sequelize, DataTypes);

//when operation neeed to menu table then it will use menu-model
// database.menu = MenuModel(sequelize, DataTypes);

//disable force attribute means if table does not exist it will cause error rather than
//create a table with that name
database.sequelize.sync({ force: false }).then(()=>{console.log("re-sync done!")});

export default database;