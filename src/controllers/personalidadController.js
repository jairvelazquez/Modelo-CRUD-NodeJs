const controller = {};


controller.list = (req, res) => {
  const query = "select * from personalidad";
  req.getConnection((err, conn) => {
    conn.query(query, (err, query) => {
     if (err) {
      res.json(err);
     }
     res.render('personalidades', {
        data: query
     });
    });
  });
};


controller.list1 = (req, res) => {
  let q1 = " select personalidad.id, personalidad.nombre, personalidad.apellidos, participa.rol, participa.id_pelicula, pelicula.nombre_p"
  let q2 = " from personalidad inner join participa on personalidad.id = participa.id_personalidad inner join pelicula on participa.id_pelicula = pelicula.id"
  let q3 = " order by personalidad.id;"
  const query = q1.concat(q2,q3);
  req.getConnection((err, conn) => {
    conn.query(query, (err, query) => {
     if (err) {
      res.json(err);
     }
     res.render('person_part', {
        data: query
     });
    });
  });
};

controller.proc1 = (req, res) => {
  const data1 = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('call agregar_personalidad_guionista(?,?,?,?,?,?)', [data1.nom,data1.ap,data1.sexo,data1.nacim,data1.gui,data1.gen], (err, personalidad) => {
      console.log(personalidad)
      res.redirect('/personalidad');
    })
  })
};
controller.proc2 = (req, res) => {
  const data2 = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('call agregar_personalidad_director(?,?,?,?,?,?,?)', [data2.nom,data2.ap,data2.sexo,data2.nacim,data2.genP,data2.est,data2.peliR], (err, personalidad) => {
      console.log(personalidad)
      res.redirect('/personalidad');
    })
  })
};
controller.proc3 = (req, res) => {
  const data3 = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('call agregar_personalidad_actor(?,?,?,?,?,?)', [data3.nom,data3.ap,data3.sexo,data3.nacim,data3.orig,data3.arq], (err, personalidad) => {
      console.log(personalidad)
      res.redirect('/personalidad');
    })
  })
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM personalidad WHERE id = ?", [id], (err, rows) => {
      res.render('personalidades_upd', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newCustomer = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE personalidad set ? where id = ?', [newCustomer, id], (err, rows) => {
    res.redirect('/personalidad');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM personalidad WHERE id = ?', [id], (err, rows) => {
      res.redirect('/personalidad');
    });
  });
}

module.exports = controller;
