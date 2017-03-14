'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ui.router',
  'ngMaterial',
  'studentApp'
]).
config(['$stateProvider', function($stateProvider) {
  var states = [
    {
      name: 'students',
      url: '/students',
      templateUrl: 'components/student/students.template.html',
      controller: 'StudentListController'
    },
    {
      name: 'viewStudent',
      url: '/students/:id/query',
      templateUrl: 'components/student/student-view.template.html',
      controller: 'StudentViewController'
    },
    {
      name: 'newStudent',
      url: '/student/new',
      templateUrl: 'components/student/student-new.template.html',
      controller: 'StudentCreateController'
    },{
      name: 'editStudent',
      url: '/students/:id/edit',
      templateUrl: 'components/student/student-edit.template.html',
      controller: 'StudentEditController'
    }
  ];

  states.forEach(function (state) {
    $stateProvider.state(state);
  });
}]).config(function($mdDateLocaleProvider) {
  $mdDateLocaleProvider.formatDate = function(date) {
    return moment(date).format('MM-DD-YYYY');
  };
});;
