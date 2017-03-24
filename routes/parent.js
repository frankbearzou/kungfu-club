var express = require('express');
var router = express.Router();
var parentDAO = require('../dao/parentDAO');

router.get('/', function (req, res, next) {
  parentDAO.queryAll(function (err, data) {
    if (err) {
      return next(err);
    } else {
      return res.json(data);
    }
  })
});


module.exports = router;