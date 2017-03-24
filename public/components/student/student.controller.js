var app = angular.module('studentApp');

app.controller('StudentCreateController', ['$scope', '$state', '$http',
  function StudentCreateController($scope, $state, $http) {
    $http.get('/api/ranks').then(function (response) {
      $scope.ranks = response.data;
    });

    $http.get('/api/parents').then(function (response) {
      $scope.parents = response.data;
      $scope.parents.unshift({
        stu_num: "",
        stu_name: "no parents need",
        stu_phone: "no parents phone"
      });
    });

    $scope.student = {
      stu_num: "",
      stu_name: "",
      stu_dob: moment().toDate(),
      stu_joinschool: moment().toDate(),
      stu_phone: "",
      stu_email: "",
      stu_address: "",
      stu_is_student: true,
      stu_is_active: true,
      stu_current_rank: "1",
      stu_father_num: ""
    };

    $scope.add = function (student) {
      var stu = angular.copy(student);
      stu.stu_dob = moment(stu.stu_dob).format('YYYY-MM-DD');
      stu.stu_joinschool = moment(stu.stu_joinschool).format('YYYY-MM-DD');

      console.log('StudentCreateController: ', stu);
      $http.post('/api/students', {'student': stu}).then(function (response) {
        console.log('return back: ', response.data);

        if (response.data.affectedRows === 1) {
          var insertId = response.data.insertId;
          var to = 'viewStudent({id:' + insertId + '})';
          console.log('to: ', to);
          $state.go('students');
        } else {
          console.log('goto: ');
          $state.go('students');
        }
      })
    };
  }
]);

app.controller('StudentListController', ['$scope', '$http', '$state',
  function StudentListController($scope, $http, $state) {
    $http.get('/api/ranks').then(function (response) {
      $scope.ranks = response.data;
      $scope.ranks.unshift({"rank_num":0,"rank_name":"All","belt_color":"All"});
    });

    $scope.cond = {
      stu_is_active: 'All', // [Active, Inactive, All]
      stu_current_rank: 0,
      stu_joinschool: '',
    };


    $scope.get = function() {
      var cond = angular.copy($scope.cond);

      $http.post('/api/students/search', {cond: cond}).then(function (response) {
        $scope.students = response.data;
      });
    };

    $scope.get();



    $scope.delete = function (id) {
      if (confirm('Do you want to delete this student?')) {
        $http.delete('/api/students/' + id).then(function (response) {
          $scope.get();
        });
      }
    }
  }
]);

app.controller('StudentViewController', ['$scope', '$state', '$stateParams', '$http',
  function StudentViewController($scope, $state, $stateParams, $http) {
    var id = $stateParams.id;
    $http.get('/api/students/' + id).then(function (response) {
      $scope.student = response.data[0];
    });

    $scope.delete = function (id) {
      if (confirm('Do you want to delete this student?')) {
        $http.delete('/api/students/' + id).then(function (response) {
          $state.go('students');
        });
      }
    }
  }
]);

app.controller('StudentEditController', ['$scope', '$stateParams', '$state', '$http',
  function StudentEditController($scope, $stateParams, $state, $http) {
    var id = $stateParams.id;

    function get() {
      $http.get('/api/students/' + id).then(function (response) {
        var student = response.data[0];
        student.stu_dob = moment(student.stu_dob, 'YYYY-MM-DD').toDate();
        student.stu_joinschool = moment(student.stu_joinschool, 'YYYY-MM-DD').toDate();
        student.stu_is_student = Boolean(student.stu_is_student);
        student.stu_is_active = Boolean(student.stu_is_active);

        $scope.student = student;
      });

      $http.get('/api/ranks').then(function (response) {
        $scope.ranks = response.data;
      });
    }

    get();


    $scope.update = function (student) {
      var stu = angular.copy(student);
      stu.stu_dob = moment(student.stu_dob).format('YYYY-MM-DD');
      stu.stu_joinschool = moment(student.stu_joinschool).format('YYYY-MM-DD');
      $http.put('/api/students/' + id, {"student": stu}).then(function (response) {
        $scope.result = response.data;
      }).then(function () {
        get();
      });
    };
  }
]);

