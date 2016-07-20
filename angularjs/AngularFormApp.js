var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider
    .when("/login", {
        title: 'Avens Publishing Group Login',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/login.html',
        controller: "loginController"
    }).when("/Dashboard", {
        title: 'Avens Publishing Group Dashboard',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/dashboard.html',
        controller: "dashboardController"
    }).when("/CreateMainCategory", {
        title: 'CreateMainCategory',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/CreateMainCategory.html',
        controller: "CreateMainCategoryController"
    }).when("/CreateJournal", {        
        title: 'CreateJournal',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/CreateJournal.html',
        controller: "CreateJournalController"
    }).when("/CreateJournalPost", {        
        title: 'CreateJournalPost',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/CreateJournalPost.html',
        controller: "CreateJournalPostController"
    }).when("/AllPosts", {        
        title: 'AllPosts',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/Allposts.html',
        controller: "AllPostsController"
    }).otherwise({
        redirectTo: "/login"
    });
});
app.controller('loginController', function($scope,$rootScope,$http){
    $scope.checkLogin = function(user) {       
        $http({
            url: 'http://localhost/avens-angular/admin/validate_credentials',
            method: "POST",
            data: user
        })
        .then(function(response) {
            window.location = 'http://localhost/avens-angular/admin#/Dashboard'
        });
    }
});
app.controller('dashboardController', function($scope,$rootScope,$http){        
    $http({
        url: 'http://localhost/avens-angular/admin/dashboard',
        method: "POST"        
    })
    .then(function(response) {
        $scope.count = response.data[0];
        return $scope;
    });    
});
app.controller('CreateJournalController', function($scope,$rootScope,$http){        
     
});
app.controller('CreateMainCategoryController', function($scope,$rootScope,$http){        
     $http({
        url: 'http://localhost/avens-angular/admin/get_categories',
        method: "POST"        
    })
    .then(function(response) {
        console.log(response.data);
        $scope.main_categories = [];
        $scope.main_categories = response.data;
        return $scope;
    }); 
});
app.controller('CreateJournalPostController', function($scope,$rootScope,$http){        
     
});
app.controller('AllPostsController', function($scope,$rootScope,$http){        
     
});