const tableModel = (sequelize, DataTypes) =>{
    const Table = sequelize.define( "Tables", {
        id:             {type: DataTypes.STRING(250), allowNull: false, primaryKey: true},
        table_number:   {type: DataTypes.INTEGER, allowNull: false},
        location:       {type: DataTypes.STRING(25), allowNull: false},
        availability:   {type: DataTypes.STRING(15), allowNull: false}
    },
    {timestamps: false, freezeTableName: true});
    return Table;
};

export default tableModel;