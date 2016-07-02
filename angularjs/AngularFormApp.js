var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/login.html',
        controller: "loginController"
    }).when("/dashboard", {
        templateUrl:'angular_pages/dashboard.html',
        controller: "dashboardController"
    }).otherwise({
        redirectTo: "/"
    });
});
app.controller('loginController', function($scope,$rootScope,$http){
    $scope.checkLogin = function(user) {
        $.ajax({
          method: 'POST',
          url: 'http://localhost/avens-angular/admin/validate_credentials',
          data:user
        }).then(function successCallback(response) {

        }, function errorCallback(response) {

        });
    }
});