var welcome = angular.module('welcome', ['ngRoute']);
welcome.config(function ($routeProvider) {
      alert('aa');
    $routeProvider
      .when("/angulardemo", {
        templateUrl:'angular_pages/form.html',
        controller: "regController"
    }).when("/login", {
        templateUrl:'angular_pages/login.html',
        controller: "loginController"
    }).when("/users", {
        templateUrl:'angular_pages/userslist.html',
        controller: "usersController"
    }).when("/edit/:user_id", {
        templateUrl:'angular_pages/edit_form.html',
        controller:"editRegistration"
    })
      .otherwise({
        redirectTo: "/angulardemo"
    });
});
welcome.controller('usersController',['$scope','$http',
function ($scope,$http)
{
       $http({
        method:'post',
        url:'http://localhost:81/Codeigniter/index.php/welcome/fetchdata',
        //data : $scope.user, //forms user object
        headers : {'Content-Type': 'application/x-www-form-urlencoded'} 
    }).success(function (data)
    {
          $scope.registrations=data;
    });

}]);