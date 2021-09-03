/* este archivo es un export de todos los archivos que va a obtener todos los datos para que determine 
automaticamente en que archivo estamos y traiga dicha comunicacion */


/* por ejemplo cuando hacemos referencia en environments se va a leer el archivo indexedDB.js */

require("dotenv").config(); //esto es para configurar todas las llaves de entorno que se tengan en el desarrollo

//requerimos los archivos de environment
const PRODUCTION = require("./production"); 
const DEVELOPMENT = require("./development");
const QA = require("./qa");

//llamamos una variable de entorno donde se desplega la aplicacion automaticamente.
const { NODE_ENV } = process.env;

//asignamos el amviente anterior a desarrollo
let currentEnv = DEVELOPMENT;

//pero si estamos en produccion o qa va a cambiar
if (NODE_ENV === "production") {
  currentEnv = PRODUCTION;
} else if (NODE_ENV === "qa") {
  currentEnv = QA;
}

module.exports = currentEnv;
