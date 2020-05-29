const controller = {};

controller.show = (req, res) => {
  res.render("buscar");
};

controller.buscaPeliculas = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador") {
    metodoAplicado = "id";
  } else if (req.body.metodo == "Nombre") {
    metodoAplicado = "nombre_p";
  } else if (req.body.metodo == "Fecha_Estreno") {
    metodoAplicado = "fecha_estreno";
  } else if (req.body.metodo == "CasaProductora") {
    metodoAplicado = "casa_productora";
  }
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select * from pelicula where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select * from pelicula where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }
  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};

controller.buscaPersonalidad = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador") {
    metodoAplicado = "id";
  } else if (req.body.metodo == "Nombre") {
    metodoAplicado = "nombre";
  } else if (req.body.metodo == "FechaNacimiento") {
    metodoAplicado = "fecha_nacimiento";
  } else if (req.body.metodo == "Edad") {
    metodoAplicado = "edad";
  } else if (req.body.metodo == "Apellido") {
    metodoAplicado = "apellidos";
  }
  let busqueda;
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select * from personalidad where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select * from personalidad where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }

  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};
controller.buscaUsuario = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador") {
    metodoAplicado = "id";
  } else if (req.body.metodo == "Nombre") {
    metodoAplicado = "nombre";
  } else if (req.body.metodo == "FechaNacimiento") {
    metodoAplicado = "fecha_nacimiento";
  } else if (req.body.metodo == "Apellido") {
    metodoAplicado = "apellido";
  } else if (req.body.metodo == "Tipo") {
    metodoAplicado = "tipo";
  } else if (req.body.metodo == "Correo") {
    metodoAplicado = "correo";
  }
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select * from usuario where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select * from usuario where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }
  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};
controller.buscaPersonalidad = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador") {
    metodoAplicado = "id";
  } else if (req.body.metodo == "Nombre") {
    metodoAplicado = "nombre";
  } else if (req.body.metodo == "FechaNacimiento") {
    metodoAplicado = "fecha_nacimiento";
  } else if (req.body.metodo == "Edad") {
    metodoAplicado = "edad";
  } else if (req.body.metodo == "Apellido") {
    metodoAplicado = "apellidos";
  }
  let busqueda;
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select * from personalidad where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select * from personalidad where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }

  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};
controller.buscaPuntuaCaliente = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador") {
    metodoAplicado = "puntua_caliente.id_pelicula";
  } else if (req.body.metodo == "Alter Ego") {
    metodoAplicado = "critico.alter_ego";
  } else if (req.body.metodo == "Calificacion") {
    metodoAplicado = "puntua_caliente.calificacion";
  }
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select puntua_caliente.id_pelicula, pelicula.nombre_p as nombre_pelicula, critico.alter_ego, puntua_caliente.comentarios," +
      " puntua_caliente.calificacion from puntua_caliente inner join pelicula on puntua_caliente.id_pelicula = pelicula.id " +
      "inner join critico on puntua_caliente.alter_ego = critico.alter_ego where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select puntua_caliente.id_pelicula, pelicula.nombre_p as nombre_pelicula, critico.alter_ego, puntua_caliente.comentarios," +
      " puntua_caliente.calificacion from puntua_caliente inner join pelicula on puntua_caliente.id_pelicula = pelicula.id " +
      "inner join critico on puntua_caliente.alter_ego = critico.alter_ego where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }
  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};
controller.buscaPuntuaEstable = (req, res) => {
  let metodoAplicado;
  if (req.body.metodo == "Identificador Pelicula") {
    metodoAplicado = "id_pelicula";
  } else if (req.body.metodo == "Identificador Usuario") {
    metodoAplicado = "id_usuario";
  }
  let sql;
  if (isNaN(req.body.busqueda)) {
    sql =
      "select puntua_estable.id_pelicula, pelicula.nombre_p as nombre_pelicula, usuario.nombre as nombre_usuario, puntua_estable.calificacion as calificacion_estable" +
      " from puntua_estable inner join pelicula on puntua_estable.id_pelicula = pelicula.id"+
      " inner join usuario on puntua_estable.id_usuario = usuario.id where " +
      metodoAplicado +
      " = '" +
      req.body.busqueda +
      "';";
  } else {
    sql =
      "select puntua_estable.id_pelicula, pelicula.nombre_p as nombre_pelicula, usuario.nombre as nombre_usuario, puntua_estable.calificacion as calificacion_estable" +
      " from puntua_estable inner join pelicula on puntua_estable.id_pelicula = pelicula.id"+
      " inner join usuario on puntua_estable.id_usuario = usuario.id where " +
      metodoAplicado +
      " = " +
      req.body.busqueda +
      ";";
  }
  console.log(sql);
  req.getConnection((err, conn) => {
    conn.query(sql, (err, resultados) => {
      if (err) {
        res.json(err);
      }
      console.log(resultados);
      res.render("resultados_busquedas", {
        data: resultados,
      });
    });
  });
};
module.exports = controller;
