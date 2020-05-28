const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    let sql = "select * from usuario;"
    conn.query(sql, (err, usuario) => {
      if (err) {
        res.json(err);
      }
      res.render("usuario", {
        data: usuario,
      });
    });
  });
};
controller.list2 = (req, res) => {
  req.getConnection((err, conn) => {
    let sql = "select usuario.nombre,usuario.apellido,usuario.telefono,usuario.edad,usuario.correo,usuario.fecha_nacimiento,usuario.no_reseñas, usuario.tipo,usuario.contrasenia,critico.alter_ego from usuario inner join critico on usuario.id = critico.id_usuario;"
    conn.query(sql, (err, sql) => {
      if (err) {
        res.json(err);
      }
      res.render("alter_ego", {
        data: sql,
      });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body);
  req.getConnection((err, connection) => {
    const query = connection.query(
      "insert into usuario(nombre,apellido,telefono,fecha_nacimiento,correo,tipo,contrasenia) values (?,?,?,?,?,?,?);",
      [data.nombre,data.apellido,data.telefono,data.fecha_nacimiento,data.correo,data.tipo,data.contrasenia],
      (err, customer) => {
        console.log(customer);
        res.redirect("/");
      }
    );
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newCustomer = req.body;
  console.log(req.body);
  req.getConnection((err, conn) => {
    conn.query(
      "UPDATE usuario set nombre = ?, apellido = ?,telefono = ?, fecha_nacimiento = ?,correo = ?, tipo =?, contrasenia = ? where id = ?",
      [
        newCustomer.nombre,
        newCustomer.apellido,
        newCustomer.telefono,
        newCustomer.fecha_nacimiento,
        newCustomer.correo,
        newCustomer.tipo,
        newCustomer.contrasenia,
        id,
      ],
      (err, rows) => {
        res.redirect("/");
      }
    );
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM usuario WHERE id = ?", [id], (err, rows) => {
      res.render("usuario_updt", {
        data: rows[0],
      });
    });
  });
};

//funciona, pero requiere modificacion para las constraints de la tabla
controller.delete = (req, res) => {
  const { id } = req.params;
  console.log(req.params);
  req.getConnection((err, connection) => {
    connection.query("DELETE FROM usuario WHERE id = ?", [id], (err, rows) => {
      res.redirect("/");
    });
  });
};

module.exports = controller;
