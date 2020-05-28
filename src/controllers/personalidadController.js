const controller = {};

controller.show = (req,res) =>{
  res.render('_personalidad');
};

controller.delete = (req, res) => {
  const {id} = req.body.id;
  console.log(req.body.id);
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM personalidad WHERE id = 10');
    res.redirect('/personalidad');
  });
}

module.exports = controller;
