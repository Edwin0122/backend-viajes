//maper del domain
const {toDomainEntity} = require("../domain/mappers")
const {toDbEntity} = require("../dal/mappers")

//Aqui se crean los metodos que manipulan la entidad
class UserService{
    //conecssion a UserRepository
    constructor({UserRepository}){
        this._userRepository = UserRepository;
    }
    async getUsers(){
        const users = await this._userRepository.getUsers();
        // aca va cualquier logica de validacion, etc

        return users.map(toDomainEntity);
    }

    async createUser(user){
        user = toDbEntity(user);
        const createdUser = await this._userRepository.createUser(user);
        return createdUser;
    }


}


module.exports = UserService;