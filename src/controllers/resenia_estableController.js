const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    let sql = "select pelicula.nombre_p,puntua_estable.calificacion,usuario.nombre as nombre_usuario from puntua_estable inner join pelicula on puntua_estable.id_pelicula = pelicula.id inner join usuario on puntua_estable.id_usuario = usuario.id;"
    conn.query(sql, (err, usuario) => {
      if (err) {
        res.json(err);
      }
      res.render("resenia_estable", {
        data: usuario,
      });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body);
  req.getConnection((err, connection) => {
    const query = connection.query(
      "insert into puntua_estable(id_pelicula,id_usuario,calificacion) values (?,?,?);",
      [data.id_pelicula,data.id_usuario,data.calificacion],
      (err, customer) => {
        console.log(customer);
        res.redirect("/resenia_estable");
      }
    );
  });
};

module.exports = controller;
