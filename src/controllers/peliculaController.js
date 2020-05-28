const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM pelicula', (err, customers) => {
     if (err) {
      res.json(err);
     }
     res.render('customers', {
        data: customers
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO pelicula set ?', data, (err, customer) => {
      console.log(customer)
      res.redirect('/pelicula');
    })
  })
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM pelicula WHERE id = ?", [id], (err, rows) => {
      res.render('customers_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newCustomer = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE pelicula set ? where id = ?', [newCustomer, id], (err, rows) => {
    res.redirect('/pelicula');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM pelicula WHERE id = ?', [id], (err, rows) => {
      res.redirect('/pelicula');
    });
  });
}

module.exports = controller;