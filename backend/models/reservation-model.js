import { DataTypes } from "sequelize";

const reservationModel = (sequelize, DataTypes) => {
    const Reservation = sequelize.define("Reservations", {
        reservation_number: {type: DataTypes.STRING(77), allowNull: false, primaryKey: true},
        table_id:           {type: DataTypes.STRING(250), allowNull: false},
        customer_phone:     {type: DataTypes.STRING(13), allowNull: false},
        reservation_date:   {type: DataTypes.DATE, allowNull:false,},
        party_size:         {type: DataTypes.INTEGER, allowNull: false},
        status: {type: DataTypes.STRING(20), allowNullNull: false, defaultValue: 'Pending'}
    },
    {timestamps: false, freezeTableName: true});
    return Reservation;
}


export default reservationModel;