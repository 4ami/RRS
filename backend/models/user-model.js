const userModel = (sequelize, DataTypes) => {
    const User = sequelize.define("User", {
        username:   { type: DataTypes.STRING, allowNull: false , primaryKey: true},
        password:   { type: DataTypes.STRING, allowNull: false },
        full_name:  { type: DataTypes.STRING, allowNull: false },
        role:       { type: DataTypes.STRING, allowNull: false },
        privileges: { type: DataTypes.STRING, allowNull: false }
    },
    {timestamps: false});

    return User;
};

export default userModel;