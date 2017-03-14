var express = require('express');
var router = express.Router();
var studentDAO = require('../dao/studentDAO');

router.get('/', function (req, res, next) {
  studentDAO.queryAll(function (err, data) {
    if (err) {
      return next(err);
    } else {
      res.json(data);
    }
  })
});

router.get('/:id', function (req, res, next) {
  var id = req.params.id;
  studentDAO.query(id, function (err, data) {
    if (err) {
      return next(err);
    } else {
      res.json(data);
    }
  });
});

router.put('/:id', function (req, res, next) {
  var id = req.params.id;
  var student = req.body.student;
  console.log('student: ', student);
  studentDAO.update(student, function (err, changedRows) {
    if (err) {
      return next(err);
    } else {
      res.json({changedRows:changedRows});
    }
  })
});

router.post('/', function (req, res, next) {
  var student = req.body.student;
  console.log(student);
  studentDAO.create(student, function (err, results) {
    console.log('results: ', results);
    if (err) {
      return next(err);
    } else {
      res.json(results);
    }
  });
});

router.delete('/:id', function (req, res, next) {
  var id = req.params.id;
  studentDAO.delete(id, function (err, data) {
    if (err) {
      return next(err);
    } else {
      res.json(data);
    }
  })
});

module.exports = router;