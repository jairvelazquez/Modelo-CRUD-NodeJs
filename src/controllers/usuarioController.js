const controller = {};

controller.list = (req, res) => {
  req.getConnection((err,conn)=>{
    conn.query("select * from usuario",(err,usuarios)=>{
        if(err){
            res.json(err);
        }
        res.render('usuario',{
            data:usuarios
        });
    });
  });
};


module.exports = controller;
