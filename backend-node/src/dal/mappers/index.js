module.exports = {
    toDbEntity(user){
        const {document_number, first_name, second_name, surname, second_surname, fk_id_tp_document, fk_country_id} = user;
        return new User ({document_number, first_name, second_name, surname, second_surname, fk_id_tp_document, fk_country_id});
    }
};