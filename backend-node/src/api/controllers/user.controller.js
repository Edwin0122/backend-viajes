class UserController{

     constructor({UserService}){
        this._userService = UserService;
    } 


    async getUsers(req, res){
        console.log();
        const users = await this._userService.getUsers();
        return res.send({
            error: false,
            payload: users
        });
    }

    async createUsers(req, res){
        const { body } = req;
        const createUser= await this._userService.createUser(body);
        return res.send({
            error: false,
            payload: createUser
        });
    } 

}

module.exports = UserController;