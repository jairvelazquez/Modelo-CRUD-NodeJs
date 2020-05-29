const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    let sql = "select pelicula.nombre,puntua_caliente.calificacion,puntua_caliente.alter_ego,puntua_caliente.comentarios from puntua_caliente inner join pelicula on puntua_caliente.id_pelicula = pelicula.id;"
    conn.query(sql, (err, usuario) => {
      if (err) {
        res.json(err);
      }
      res.render("resenia_caliente", {
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
      "insert into puntua_caliente(id_pelicula,alter_ego,calificacion,comentarios) values (?,?,?,?);",
      [data.id_pelicula,data.alter_ego,data.calificacion,data.comentarios],
      (err, customer) => {
        console.log(customer);
        res.redirect("/resenia_caliente");
      }
    );
  });
};

module.exports = controller;
