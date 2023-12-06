import dotenv from 'dotenv';
dotenv.config();
const DB = {
    user: process.env.USER,
    password: process.env.PASS,
    database: process.env.DB,
    port: process.env.DB_PORT,
    dialect: "mysql",
    sync: {force: false},
    define: {freezeTableName: true},
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
};

export default DB;