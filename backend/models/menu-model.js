const menuModel = (sequelize, DataTypes) => {
    const Menu = sequelize.define("Menu",{
        id:          {type: DataTypes.STRING(30), allowNull: false, primaryKey: true},
        category:    {type: DataTypes.STRING(30), allowNull: false},
        kitchen:     {type: DataTypes.STRING(40), allowNull: false},
        dish:        {type: DataTypes.STRING(30), allowNull: false},
        dish_desc:   {type: DataTypes.TEXT, allowNull: true},
        calories:    {type: DataTypes.DOUBLE, allowNull: false},
        price:       {type: DataTypes.DOUBLE, allowNull: false},
        image:       {type: DataTypes.TEXT, allowNull: false},
    },
    {timestamps: false, freezeTableName: true});

    return Menu;
}

export default menuModel;