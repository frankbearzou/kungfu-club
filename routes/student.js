var express = require('express');
var router = express.Router();
var studentDAO = require('../dao/studentDAO');

router.post('/search', function (req, res, next) {
  var condition = req.body.cond;
  var cond = '';
  console.log('cond: ', condition);

  // stu_is_active
  if (condition.stu_is_active === 'All') {
    delete condition['stu_is_active'];
  } else if (condition.stu_is_active === 'Active') {
    cond += ' and stu_is_active=1';
  } else if (condition.stu_is_active === 'Inactive') {
    cond += ' and stu_is_active=0';
  }

  // stu_current_rank
  if (condition.stu_current_rank !== 0) {
    cond += ' and stu_current_rank=' + condition.stu_current_rank;
  }

  // stu_joinschool
  if (condition.stu_joinschool && condition.stu_joinschool != '') {
    cond += ' and year(stu_joinschool)=' + condition.stu_joinschool;
  }

  studentDAO.queryAll(cond, function (err, data) {
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
  if (student.stu_father_num === "") {
    student.stu_father_num = undefined;
  }
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