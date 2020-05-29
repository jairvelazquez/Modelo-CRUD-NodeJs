const controller = {};

controller.list = (req, res) => {
  let ca1 = " select pelicula.nombre_p, pelicula.fecha_estreno, pelicula.ranking_estable, pelicula.sinopsis, pelicula.ranking_caliente, pelicula.casa_productora, genero.id, terror.sub_genero ";
  let ca2 = " from genero inner join pelicula on pelicula.id=genero.id inner join terror on terror.id_genero=genero.id union select pelicula.nombre_p, pelicula.fecha_estreno, pelicula.ranking_estable,";
  let ca3 = " pelicula.sinopsis, pelicula.ranking_caliente, pelicula.casa_productora, genero.id, accion.sub_genero ";
  let ca4 = " from genero inner join pelicula on pelicula.id=genero.id inner join accion on accion.id_genero=genero.id union select pelicula.nombre_p, pelicula.fecha_estreno, pelicula.ranking_estable, pelicula.sinopsis,";
  let ca5 = " pelicula.ranking_caliente, pelicula.casa_productora, genero.id, drama.sub_genero";
  let ca6 = " from genero inner join pelicula on pelicula.id=genero.id inner join drama on drama.id_genero=genero.id";
  const query = ca1.concat(ca2, ca3, ca4, ca5, ca6);
  req.getConnection((err, conn) => {
    conn.query(query, (err, query) => {
     if (err) {
      res.json(err);
     }
     res.render('peliculasView', {
        data: query
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO pelicula(nombre_p,fecha_estreno,ranking_estable,sinopsis,ranking_caliente,casa_productora,id_genero) values(?,?,?,?,?,?,?);',
      [data.nombre,data.fecha_estreno,data.ranking_estable,data.sinopsis,data.ranking_caliente,data.casa_productora,data.id_genero], (err, pelicula) => {
      res.redirect('/peliculas');
    })
  })
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM pelicula WHERE id = ?", [id], (err, rows) => {
      res.render('peliculas_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  console.log("Llega");
  const { id } = req.params;
  const data = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE pelicula set nombre_p = ?,fecha_estreno = ?, ranking_estable = ?, sinopsis =?, ranking_caliente = ?, casa_productora = ?, id_genero = ? where id = ?',
   [data.nombre,data.fecha_estreno,data.ranking_estable,data.sinopsis,data.ranking_caliente,data.casa_productora,data.id_genero, id], (err, rows) => {
    res.redirect('/peliculas');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM pelicula WHERE id = ?', [id], (err, rows) => {
      res.redirect('/peliculas');
    });
  });
}
controller.parti = (req, res) => {
  const data = req.body;
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO participa set ?', data, (err, pelicula) => {
      console.log(pelicula)
      res.redirect('/personalidad/participaciones');
    });
  });
}

controller.muestra = (req, res) => {
  console.log(req.body);
  req.getConnection((err, connection) => {
    res.render('participa_add');
  });
}
module.exports = controller;