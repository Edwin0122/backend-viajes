//attributes nos ayuda a configurrar nuestras entidades de nuestra clase
const {attributes} = require("structure");


//llamamos la funcion attributes para pasarle nuestros objetos de la DB
const User = attributes({
    document_number:{
        type: String,
        require: true
    },
    first_name:{
        type: String,
        require: true
    },
    second_name:{
        type: String
    },
    surname:{
        type: String,
        require: true
    },
    second_surname:{
        type: String
    },
    fk_id_tp_document:{
        type: Number
    },
    fk_country_id:{
        type: Number
    }
})//hacemos el retorno de una funcion
(class User{
    getCompleteName(){
        return this.first_name+ " "+this.surname;
    }
});


module.exports = User;