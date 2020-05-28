const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM personalidad', (err, personalidad) => {
     if (err) {
      res.json(err);
     }
     res.render('personalidades', {
        data: personalidad
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO personalidad set ?', data, (err, personalidad) => {
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

module.exports = controller;
