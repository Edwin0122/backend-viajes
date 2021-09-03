//archivo de configuraciones de nuestro proyecto

class StartUp {

  //en el constructor resivimos nuestro server.js
  constructor({ server }) {
    this._server = server;
  }

  async start() {
    await this._server.start();
  }
}

module.exports = StartUp;
