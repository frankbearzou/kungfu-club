var mysql = require('mysql');
require('dotenv').config();
console.log('mysql: ', process.env.MYSQL);
var pool = mysql.createPool(process.env.MYSQL);


module.exports.create = function (student, callback) {
  pool.getConnection(function (error, conn) {
    if (error) {
      callback(error);
    } else {
      var sql = 'insert into student(stu_name,stu_dob,stu_joinschool,stu_phone,stu_email,stu_address,stu_is_student,stu_is_active,stu_current_rank,stu_father_num) values(?,?,?,?,?,?,?,?,?,?);';
      var prep = [student.stu_name, student.stu_dob, student.stu_joinschool, student.stu_phone, student.stu_email, student.stu_address, student.stu_is_student, student.stu_is_active, student.stu_current_rank, student.stu_father_num];
      conn.query(sql, prep, function (error, results, fields) {
        callback(error, results);
        conn.release();
      })
    }
  });
};

module.exports.queryAll = function (cond, callback) {
  cond = cond ? cond : '';
  pool.getConnection(function (error, conn) {
    if (error) {
      callback(error);
    } else {
      var sql = 'select stu_num,stu_name,stu_dob,stu_joinschool,stu_phone,stu_email,stu_address,stu_is_student,stu_is_active,concat(stu_current_rank, ".", r.rank_name) rank_name from student s, rank r where 1=1 and s.stu_current_rank = r.rank_num' + cond + ';';
      conn.query(sql, function (error, results, fields) {
        callback(error, results);
        conn.release();
      });
    }
  });
};

module.exports.query = function (id, callback) {
  pool.getConnection(function (error, conn) {
    if (error) {
      callback(error);
    } else {
      var sql = 'select stu_num,stu_name,stu_dob,stu_joinschool,stu_phone,stu_email,stu_address,stu_is_student,stu_is_active,stu_current_rank,concat(stu_current_rank, ".", r.rank_name) rank_name,stu_father_num from student s, rank r where s.stu_current_rank = r.rank_num and stu_num = ?;';
      conn.query(sql, [id], function (error, results, fields) {
        callback(error, results);
        conn.release();
      });
    }
  });
};

module.exports.update = function (student, callback) {
  pool.getConnection(function (error, conn) {
    console.log('update: ', student.stu_dob, typeof student.stu_dob);

    var sql = 'update student set stu_name=?,stu_dob=?,stu_joinschool=?,stu_phone=?,stu_email=?,stu_address=?,stu_is_student=?,stu_is_active=?,stu_current_rank=? where stu_num=?;';
    var prep = [student.stu_name, student.stu_dob, student.stu_joinschool, student.stu_phone, student.stu_email, student.stu_address, student.stu_is_student, student.stu_is_active, student.stu_current_rank, student.stu_num];
    conn.query(sql, prep, function (error, results, fields) {
      callback(error, results.changedRows);
      conn.release();
    })
  })
};

module.exports.delete = function (id, callback) {
  pool.getConnection(function (error, conn) {
    var sql = 'delete from student where stu_num=?';
    conn.query(sql, [id], function (error, results, fields) {
      callback(error, results);
      conn.release();
    });
  })
};
