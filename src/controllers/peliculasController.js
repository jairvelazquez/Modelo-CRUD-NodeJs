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
        conn.query('INSERT INTO pelicula set ?', [data], (err,rows) => {
            res.redirect('/');
        });
    })
};

controller.edit =(req, res) => {
    const {id} = req.params;

    req.getConnection((err, conn) =>{
        conn.query('SELECT * FROM pelicula WHERE id ?', [id], (err, row));
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
        conn.query('DELETE FROM pelicula WHERE id = ?', [id], (err, rows) => {
            res.redirect('/pelicula');
        });
    }) 
};


controller.buscar = (req, res) =>{
    const {nombre} = req.params;
    req.getConnection((err, conn) => {
        controller.query('SELECT pelicula.nombre FROM pelicula WHERE pelicula = ?' [nombre], (err,row) => {
            res.redirect('/');
        });
    });
};
module.exports = controller;