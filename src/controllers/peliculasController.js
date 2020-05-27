const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.quey('select * from pelicula',(err, peliculas) => {
            if(err){
                res.json(err);
            }

            res.render('peliculasView', {
                data: peliculas
            });
        });
    });
};

module.exports = controller;