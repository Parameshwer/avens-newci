var app = angular.module('myApp', ['ngRoute']);
var base_url = "http://localhost/avens-angular/";
//console.log(app);
app.factory("services", ['$http', function($http) {
  var serviceBase = 'services/'
    var obj = {};
    obj.get_main_category = function(main_cat_id){
        return $http.get(base_url+"admin/get_main_category?id="+main_cat_id+"");
    }
    obj.get_journal = function(main_cat_id){
        return $http.get(base_url+"admin/get_journal?id="+main_cat_id+"");
    }
    obj.get_journalPage = function(PageId){
        return $http.get(base_url+"admin/get_journalPage?id="+PageId+"");
    }
    obj.insertCategory = function (main_category) {
        return $http.get(base_url+"admin/insert_main_category?name="+main_category.cateogry_name+"");       
        
    };
    obj.get_journals = function(journal_type) {        
        return $http.get(base_url+"admin/get_journals?name="+journal_type+"");
    }
    obj.updateCategory = function (id,main_category) {        
        //return $http.get(base_url+"admin/insert_main_category?name="+main_category.category_name+"&id="+main_category.category_id+"");
        var params = [];
        params.push("category_id="+id+"");
        params.push("category_name="+main_category.category_name+"");
        $http({
            url: base_url+"admin/insert_main_category",
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            data : JSON.stringify({"category_id":id,"category_name":main_category.category_name})          
        })
        .then(function(response) {
            console.log(response);
            if(response.status) {
                window.location = base_url+'admin#/MainCategories'                
            }
        });
    };
    obj.updateJournal = function (id,main_journal) {        
        //return $http.get(base_url+"admin/insert_main_category?name="+main_category.category_name+"&id="+main_category.category_id+"");
        console.log(main_journal);
        /*if(!id) {
            main_journal.main_category_id = 0;
        }*/
        $http({
            url: base_url+"admin/insert_journal",
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            data : JSON.stringify(main_journal)          
        })
        .then(function(response) {
            console.log(response);
            if(response.status) {
                window.location = base_url+'admin#/Journals/medical'                
            }
        });
    };
    return obj;   
}]);
app.controller('EditMaincategoryController', function($scope,$rootScope,$routeParams,$location,services,main_category){        
    var main_cat_id = ($routeParams.MaincatID) ? parseInt($routeParams.MaincatID) : 0;
    $rootScope.title = (main_cat_id > 0) ? 'Edit Category' : 'Add Category';
    $scope.buttonText = (main_cat_id > 0) ? 'Update Category' : 'Add New Category';    
    var original = main_category.data[0];    
    $scope.main_category = original;
    $scope.isClean = function() {
       return angular.equals(original, $scope.main_category);
    }
    $scope.saveCategory = function(main_category) {
        if (main_cat_id <= 0) {
            services.updateCategory("0",main_category);
        }
        else {
            services.updateCategory(main_cat_id, main_category);
        }
    }
});
app.controller('EditJournalController', function($scope,$rootScope,$routeParams,$location,services,main_journal) { 
    var journal_id = ($routeParams.journal_id) ? parseInt($routeParams.journal_id) : 0;
    $rootScope.title = (journal_id > 0) ? 'Edit Journal' : 'Add Journal';
    $scope.buttonText = (journal_id > 0) ? 'Update Journal' : 'Add New Journal';    
    var original = main_journal.data[0];    
    $scope.main_journal = original;
    //$scope.options = [{ name: "Medical", id: 10 }, { name: "Biotechnolgy", id: 20 },{ name: "Pharmaseutical", id: 30 },{ name: "Biology", id: 40 }];
    //$scope.selectedOption = $scope.options[1];
    $scope.isClean = function() {
       return angular.equals(original, $scope.main_journal);
    }
    $scope.saveJournal = function(main_journal) {
        if (journal_id <= 0) {
            services.updateJournal(0,main_journal);
        }
        else {
            services.updateJournal(journal_id, main_journal);
        }
    }
});
app.controller('EditJournalPageController', function($scope,$rootScope,$routeParams,$location,services,main_page) { 
    var page_id = ($routeParams.Page_id) ? parseInt($routeParams.Page_id) : 0;
    $rootScope.title = (page_id > 0) ? 'Edit Journal Page' : 'Add Journal Page';
    $scope.buttonText = (page_id > 0) ? 'Update Journal Page' : 'Add New Journal Page';    
    var original = main_page.data[0];    
    $scope.main_page = original;
    //$scope.options = [{ name: "Medical", id: 10 }, { name: "Biotechnolgy", id: 20 },{ name: "Pharmaseutical", id: 30 },{ name: "Biology", id: 40 }];
    //$scope.selectedOption = $scope.options[1];
    $scope.isClean = function() {
       return angular.equals(original, $scope.main_page);
    }
    $scope.saveJournalPage = function(main_page) {
        if (page_id <= 0) {
            services.updateJournal(0,main_page);
        }
        else {
            services.updateJournal(page_id, main_page);
        }
    }
});
app.controller('JournalsController', function($scope,services) {    
    services.get_journals().then(function(data){      
        $scope.main_journals = data.data;
    });
});
app.config(['$routeProvider',function ($routeProvider) {
    $routeProvider
    .when("/login", {
        title: 'Avens Publishing Group Login',
        templateUrl:base_url+'admin1/angular_pages/login.html',
        controller: "loginController"
    }).when("/Dashboard", {
        title: 'Avens Publishing Group Dashboard',
        templateUrl:base_url+'admin1/angular_pages/dashboard.html',
        controller: "dashboardController"
    }).when("/MainCategories", {
        title: 'MainCategories',
        templateUrl:base_url+'admin1/angular_pages/MainCategories.html',
        controller: "MainCategoriesController"
    }).when("/Journals/:name", {        
        title: 'Journals',
        templateUrl:base_url+'admin1/angular_pages/journals.html',
        controller: "JournalsController",
        resolve: {
          journals_service: function(services, $route){            
            var journal_type = $route.current.params.name;
            services.get_journals(journal_type);            
          }
        }
    }).when("/JournalPosts", {        
        title: 'JournalPosts',
        templateUrl:base_url+'admin1/angular_pages/JournalPosts.html',
        controller: "JournalPostsController",
    }).when("/AllPosts", {        
        title: 'AllPosts',
        templateUrl:base_url+'admin1/angular_pages/Allposts.html',
        controller: "AllPostsController"
    }).when("/EditMainCategory/:MaincatID", {        
        title: 'Edit Main Category',
        templateUrl:base_url+'admin1/angular_pages/edit-maincategory.html',
        controller: "EditMaincategoryController",
        resolve: {
          main_category: function(services, $route){            
            var main_cat_id = $route.current.params.MaincatID;
            return services.get_main_category(main_cat_id);
          }
        }    
    }).when("/EditJournals/:JournalID", {        
        title: 'Edit Journal',
        templateUrl:base_url+'admin1/angular_pages/edit-journals.html',
        controller: "EditJournalController",
        resolve: {
          main_journal: function(services, $route){            
            var journal_id = $route.current.params.JournalID;
            return services.get_journal(journal_id);
          }
        }    
    }).when("/EditJournalPage/:pageID", {        
        title: 'Edit Journal Page',
        templateUrl:base_url+'admin1/angular_pages/edit-journal-page.html',
        controller: "EditJournalPageController",
        resolve: {
          main_page: function(services, $route){            
            var Page_id = $route.current.params.pageID;
            return services.get_journalPage(Page_id);
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
            url: base_url+'admin/validate_credentials',
            method: "POST",
            data: user
        })
        .then(function(response) {
            window.location = base_url+'admin#/Dashboard'
        });
    }
});
app.controller('dashboardController', function($scope,$rootScope,$http){        
    $http({
        url: base_url+'admin/dashboard',
        method: "POST"        
    })
    .then(function(response) {
        $scope.count = response.data[0];
        return $scope;
    });    
});
/*app.controller('JournalsController', function($scope,$rootScope,$http){        
     $http({
        url: base_url+'admin/get_journals',
        method: "POST"        
    })
    .then(function(response) {
        $scope.main_journals = response.data;
        return $scope;
    }); 
});*/
app.controller('MainCategoriesController', function($scope,$rootScope,$http){        
    $http({
        url: base_url+'admin/get_categories',
        method: "POST"        
    })
    .then(function(response) {
        $scope.main_categories = response.data;
        return $scope;
    }); 
});
app.controller('JournalPostsController', function($scope,$rootScope,$http){        
    $http({
        url: base_url+'admin/get_journals_posts',
        method: "POST"        
    })
    .then(function(response) {
        $scope.journal_posts = response.data;
        return $scope;
    });
});
