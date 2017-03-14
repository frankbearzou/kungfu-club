var express = require('express');
var router = express.Router();
var rankDAO = require('../dao/rankDAO');

router.get('/', function (req, res, next) {
  rankDAO.queryAll(function (err, data) {
    if (err) {
      return next(err);
    } else {
      return res.json(data);
    }
  })
});


module.exports = router;