const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('select * from pelicula',(err, rows) => {
            if(err){
                res.json(err);
            }

            res.render('peliculasView', {
                data: pelicula
            });
        });
    });
};

controller.save = (req, res) =>{
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query('INSERT INTO peliculas set ?', [data], (err,rows) => {
            res.redirect('/');
        });
    })
};

controller.edit =(req, res) => {
    const {id} = req.params;

    req.getConnection((err, conn) =>{
        conn.query('SELECT * FROM peliculas WHERE id ?', [id], (err, row));
        res.render('peliculas_edit', {
            data: pelicula
        });
    });
};


controller.update = (req, res) => {
    const {id} = req.params;
    const newPelicula = req.body;
    req.getConnection((err,conn) => {
        conn.query('UPDATE pelicula set ? WHERE id = ?', [newPelicula, id], (err, row) => {
            res.redirect('/');
        });
    });
};

controller.delete = (req, res) => {
    const {id} = req.params;
    req.getConnection((err, conn) => {
        conn.query('DELETE FROM peliculas WHERE id = ?', [id], (err, rows) => {
            res.redirect('/');
        });
    }) 
};

module.exports = controller;