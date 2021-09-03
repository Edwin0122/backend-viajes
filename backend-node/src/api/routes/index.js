//archivo para resivir todo el contenido de rutas


const { Router } = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const compression = require("compression");


module.exports = function({ UserRoutes }) {
  const router = Router();
  const apiRoute = Router();

  //se va a usar diferenes middlewares
  apiRoute
    .use(cors())
    .use(bodyParser.json())
    .use(compression());

    //configuracion de rutas que estan inyectadas
  apiRoute.use("/user", UserRoutes);
/*   apiRoute.use("/teacher", TeacherRoutes);
  apiRoute.use("/course", CourseRoutes); */
  router.use("/api", apiRoute);

  return router;
};
