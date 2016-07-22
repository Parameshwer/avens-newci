var app = angular.module('myApp', ['ngRoute']);
console.log(app);
app.factory("services", ['$http', function($http) {
  var serviceBase = 'services/'
    var obj = {};
    obj.get_main_category = function(main_cat_id){
        return $http.get("http://localhost/avens-angular/admin/get_main_category?id="+main_cat_id+"");
    }
    obj.insertCategory = function (main_category) {
        return $http.get("http://localhost/avens-angular/admin/insert_main_category?name="+main_category.cateogry_name+"");
        
    };
    obj.updateCategory = function (id,main_category) {        
        return $http.get("http://localhost/avens-angular/admin/insert_main_category?name="+main_category.category_name+"&id="+main_category.category_id+"");
    };
    return obj;   
}]);
app.controller('EditMaincategoryController', function($scope,$rootScope,$routeParams,$location,services,main_category){        
    var main_cat_id = ($routeParams.MaincatID) ? parseInt($routeParams.MaincatID) : 0;
    console.log(main_cat_id);
    $rootScope.title = (main_cat_id > 0) ? 'Edit Category' : 'Add Category';
    $scope.buttonText = (main_cat_id > 0) ? 'Update Category' : 'Add New Category';    
    var original = main_category.data[0];    
    $scope.main_category = original;
    $scope.isClean = function() {
       return angular.equals(original, $scope.main_category);
    }
    $scope.saveCategory = function(main_category) {
        if (main_cat_id <= 0) {
            services.insertCategory(main_category);
        }
        else {
            services.updateCategory(main_cat_id, main_category);
        }
    }
});
app.config(['$routeProvider',function ($routeProvider) {
    $routeProvider
    .when("/login", {
        title: 'Avens Publishing Group Login',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/login.html',
        controller: "loginController"
    }).when("/Dashboard", {
        title: 'Avens Publishing Group Dashboard',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/dashboard.html',
        controller: "dashboardController"
    }).when("/MainCategories", {
        title: 'MainCategories',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/MainCategories.html',
        controller: "MainCategoriesController"
    }).when("/Journals", {        
        title: 'Journals',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/journals.html',
        controller: "JournalsController"
    }).when("/JournalPosts", {        
        title: 'JournalPosts',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/JournalPosts.html',
        controller: "JournalPostsController"
    }).when("/AllPosts", {        
        title: 'AllPosts',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/Allposts.html',
        controller: "AllPostsController"
    }).when("/EditMainCategory/:MaincatID", {        
        title: 'Edit Main Category',
        templateUrl:'http://localhost/avens-angular/admin1/angular_pages/edit-maincategory.html',
        controller: "EditMaincategoryController",
        resolve: {
          main_category: function(services, $route){            
            var main_cat_id = $route.current.params.MaincatID;
            return services.get_main_category(main_cat_id);
          }
        }    
    })
    .otherwise({
        redirectTo: "/login"
    });
}]);

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
app.controller('JournalsController', function($scope,$rootScope,$http){        
     $http({
        url: 'http://localhost/avens-angular/admin/get_journals',
        method: "POST"        
    })
    .then(function(response) {
        $scope.main_journals = response.data;
        return $scope;
    }); 
});
app.controller('MainCategoriesController', function($scope,$rootScope,$http){        
    $http({
        url: 'http://localhost/avens-angular/admin/get_categories',
        method: "POST"        
    })
    .then(function(response) {
        $scope.main_categories = response.data;
        return $scope;
    }); 
});
app.controller('JournalPostsController', function($scope,$rootScope,$http){        
    $http({
        url: 'http://localhost/avens-angular/admin/get_journals_posts',
        method: "POST"        
    })
    .then(function(response) {
        $scope.journal_posts = response.data;
        return $scope;
    });
});
