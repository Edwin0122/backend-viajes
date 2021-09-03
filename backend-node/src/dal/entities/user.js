module.exports = function(sequelize, DataTypes){
    return sequelize.define(
        "users",
        {
            document_number:{
                type: DataTypes.STRING,
                allowNull: false,
                primaryKey:true
                
            },
            first_name:{
                type: DataTypes.STRING,
                allowNull: false
            },
            second_name:{
                type: DataTypes.STRING,
                allowNull: true
            },
            surname:{
                type: DataTypes.STRING,
                allowNull: false
            },
            second_surname:{
                type: DataTypes.STRING,
                allowNull:  true
            },
            fk_id_tp_document:{
                type: DataTypes.INTEGER
            },
            fk_country_id:{
                type: DataTypes.INTEGER
            }
        },
        {
            tableName: "users",
            timestamps: false
        }
    );
};