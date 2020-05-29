const express = require("express"),
  path = require("path"),
  morgan = require("morgan"),
  mysql = require("mysql"),
  myConnection = require("express-myconnection");

const app = express();
/*importing routes*/
const usuarioRoutes = require("./routes/usuarios");
const personalidadRoutes = require("./routes/personalidad");
const peliculaRoutes = require ("./routes/peliculas");
const reseniaRoutes = require("./routes/resenia_estable");
const reseniaCalienteRoutes = require("./routes/resenia_caliente");
const buscarRoutes = require("./routes/buscar");
// settings
app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

// middlewares
app.use(morgan("dev"));
app.use(
  myConnection(
    mysql,
    {
      host: "localhost",
      user: "root",
      password: "password",
      port: 3309,
      dateStrings:true,
      database: "cinecut",
    },
    "single"
  )
);

app.use(express.urlencoded({ extended: false }));

//routes
app.use("/", usuarioRoutes);
app.use("/peliculas", peliculaRoutes);
app.use("/personalidad", personalidadRoutes);
app.use("/resenia_estable", reseniaRoutes);
app.use("/resenia_caliente",reseniaCalienteRoutes);
app.use("/buscar",buscarRoutes);
// static files
app.use(express.static(path.join(__dirname, "public")));

// starting the server
app.listen(app.get("port"), () => {
  console.log(`server on port ${app.get("port")}`);
});
