var app = angular.module('myApp', ['ngRoute','ui.tinymce','textAngular']);
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
    obj.get_journalArchive = function(archive_id) {        
        return $http.get(base_url+"admin/get_journal_archive?id="+archive_id+"");
    }
    obj.get_LatestArticle = function(article_id) {        
        return $http.get(base_url+"admin/get_latest_Article?id="+article_id+"");
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
        main_journal.journal_url_slug = main_journal.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');        
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
    obj.updateJournalPage = function (id,journal_page,scope) {        
        //return $http.get(base_url+"admin/insert_main_category?name="+main_category.category_name+"&id="+main_category.category_id+"");
        /*if(!id) {
            journal_page.main_category_id = 0;
        }*/
        console.log(journal_page);
        journal_page.journal_post_slug = journal_page.post_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');        
        $.each(scope.journal_info,function(i,v){
            if(v.id == journal_page.journal_id) {                
                console.log(v);
                journal_page.journal_slug = v.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');                            
            }
        });
        $http({
            url: base_url+"admin/update_journal_page",
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            data : JSON.stringify(journal_page)          
        })
        .then(function(response) {
            console.log(response);
            if(response.status) {
                window.location = base_url+'admin#/JournalPosts'                
            }
        });
    };
    obj.updateJournalArchive = function (id,archive_info,scope) {        
        //return $http.get(base_url+"admin/insert_main_category?name="+main_category.category_name+"&id="+main_category.category_id+"");
        /*if(!id) {
            archive_info.main_category_id = 0;
        }*/
        console.log(archive_info);        
        $.each(scope.journal_info,function(i,v){
            if(v.id == archive_info.journal_id) {                
                console.log(v);
                archive_info.journal_slug = v.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');                            
            }
        });
        $http({
            url: base_url+"admin/update_archive",
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            data : JSON.stringify(archive_info)          
        })
        .then(function(response) {
            console.log(response);
            if(response.status) {
                window.location = base_url+'admin#/archives'                
            }
        });
    };
    obj.updateLatestArticle = function (id,article_info,scope) {        
        console.log(article_info);
        $http({
            url: base_url+"admin/update_latest_article",
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            data : JSON.stringify(article_info)          
        })
        .then(function(response) {
            console.log(response);
            if(response.status) {
                window.location = base_url+'admin#/LatestArticles'                
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
    $scope.convertToJournalSlug = function(elem) {
        $('#journal_url_slug').val(elem.main_journal.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-'));         
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

    var page_id = ($routeParams.pageID) ? parseInt($routeParams.pageID) : 0;
    $rootScope.title = (page_id > 0) ? 'Edit Journal Page' : 'Add Journal Page';
    $scope.buttonText = (page_id > 0) ? 'Update Journal Page' : 'Add New Journal Page';    
    console.log(page_id);
    var original = main_page.data.post_info;
   console.log(original[0]); 
    $scope.main_page = original[0];
    $scope.journal_info = main_page.data.journal_info;    
    //$scope.options = [{ name: "Medical", id: 10 }, { name: "Biotechnolgy", id: 20 },{ name: "Pharmaseutical", id: 30 },{ name: "Biology", id: 40 }];
    //$scope.selectedOption = $scope.options[1];
    $scope.isClean = function() {
       return angular.equals(original, $scope.main_page);
    }
    $scope.saveJournalPage = function(main_page) {        
        console.log(main_page);        
        if (page_id <= 0) {            
            services.updateJournalPage(0,main_page,$scope);
        }
        else {
            services.updateJournalPage(page_id, main_page,$scope);
        }
    }
    /*$scope.tinymceOptions = {
        onChange: function(e) {
          // put logic here for keypress and cut/paste changes
        },
        inline: false,
        plugins : 'advlist autolink link image lists charmap print preview link media',
        skin: 'lightgray',
        theme : 'modern',
        width : 600,
        height : 300
      };*/
    $scope.convertToPostSlug = function(elem) {        
        $('#journal_post_slug').val(elem.main_page.post_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-'));         
    };
    $scope.convertToJournalSlug = function(elem) {        
        $.each($scope.journal_info,function(i,v){
            if(v.id == elem){                
                    $('#journal_slug').val(v.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-'));                            
            }
        });        

    };
});

app.controller('wysiwygeditor', ['$scope', 'textAngularManager', function wysiwygeditor($scope, textAngularManager) {
    $scope.version = textAngularManager.getVersion();
    $scope.versionNumber = $scope.version.substring(1);
    $scope.orightml = '';
    $scope.htmlcontent = $scope.orightml;
    $scope.disabled = false;
}]);

app.controller('EditLatestArticleController', function($scope,$rootScope,$routeParams,$location,services,latest_articles){        
   var article_id = ($routeParams.ArchiveId) ? parseInt($routeParams.ArchiveId) : 0;
    $rootScope.title = (article_id > 0) ? 'Edit Latest Article' : 'Add Latest Article';
    $scope.buttonText = (article_id > 0) ? 'Update Latest Article' : 'Add New Latest Article';

    $scope.latest_article = latest_articles.data.article_info[0];
    $scope.journal_info = latest_articles.data.journal_info;

    $scope.saveLatestArticle = function(latest_article) {        
        console.log(latest_article);        
        if (article_id <= 0) {            
            services.updateLatestArticle(0,latest_article,$scope);
        }
        else {
            services.updateLatestArticle(archive_id, latest_article,$scope);
        }
    }
});
app.controller('EditJournalArchiveController', function($scope,$rootScope,$routeParams,$location,services,archive) { 
    var archive_id = ($routeParams.ArchiveId) ? parseInt($routeParams.ArchiveId) : 0;
    $rootScope.title = (archive_id > 0) ? 'Edit Journal Archive' : 'Add Journal Archive';
    $scope.buttonText = (archive_id > 0) ? 'Update Journal Archive' : 'Add New Journal Archive';    
    var archive_years = [];
    for (var i = 2000; i <=  2016 ; i++) {
        archive_years.push(i);
    }
    var original = archive.data.archive_info;
    $scope.archive_info = original[0];
    $scope.journal_info = archive.data.journal_info;  
    $scope.volumes_arr = [{"id":"volume-1-issue-1","name":"volume 1 issue 1"},{"id":"volume-1-issue-2","name":"volume 1 issue 2"},{"id":"volume-2-issue-1","name":"volume 2 issue 1"},{"id":"volume-2-issue-2","name":"volume 2 issue 2"},{"id":"volume-3-issue-1","name":"volume 3 issue 1"},{"id":"volume-3-issue-2","name":"volume 3 issue 2"},{"id":"volume-4-issue-1","name":"volume 4 issue 1"},{"id":"volume-4-issue-2","name":"volume 4 issue 2"}];
    $scope.archive_years = archive_years;
    $scope.archive_type = [{"id":"1","name":"Archive In Press"},{"id":"2","name":"Current Issue"},{"id":"3","name":"Archive"}]

    $scope.tinymceOptions = {
        onChange: function(e) {
          // put logic here for keypress and cut/paste changes
        },
        inline: false,
        plugins : 'advlist autolink link image lists charmap print preview link media',
        skin: 'lightgray',
        theme : 'modern',
        width : 600,
        height : 300
      };

    $scope.convertToJournalSlug = function(elem) {        
        $.each($scope.journal_info,function(i,v){
            if(v.id == elem){                
                    $('#journal_slug').val(v.journal_name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-'));                            
            }
        });        

    };
    $scope.saveJournalArchive = function(archive_info) {        
        console.log(archive_info);        
        if (archive_id <= 0) {            
            services.updateJournalArchive(0,archive_info,$scope);
        }
        else {
            services.updateJournalArchive(archive_id, archive_info,$scope);
        }
    }
});

app.controller('JournalsController', function($scope,services) {    
    services.get_journals().then(function(data){
    console.log(data);      
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
    }).when("/archives", {        
        title: 'Journal Archives',
        templateUrl:base_url+'admin1/angular_pages/JournalArchives.html',
        controller: "JournalArchiveController",
    }).when("/LatestArticles", {        
        title: 'Latest Articles',
        templateUrl:base_url+'admin1/angular_pages/LatestArticles.html',
        controller: "LatestArticlesController",
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
    }).when("/EditJournalArchive/:ArchiveId", {        
        title: 'Edit Journal Archive',
        templateUrl:base_url+'admin1/angular_pages/edit-journal-archive.html',
        controller: "EditJournalArchiveController",
        resolve: {
          archive: function(services, $route){            
            var archive_id = $route.current.params.ArchiveId;
            console.log(archive_id);
            return services.get_journalArchive(archive_id);
          }
        }    
    }).when("/EditLatestArticle/:ArticleId", {        
        title: 'Edit Latest Article',
        templateUrl:base_url+'admin1/angular_pages/edit-latest-article.html',
        controller: "EditLatestArticleController",
        resolve: {
          latest_articles: function(services, $route){            
            var article_id = $route.current.params.ArticleId;            
            return services.get_LatestArticle(article_id);
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
        console.log(response);
        $scope.journal_posts = response.data;
        return $scope;
    });
});
app.controller('JournalArchiveController', function($scope,$rootScope,$http){        
    $http({
        url: base_url+'admin/get_journals_archives',
        method: "POST"        
    })
    .then(function(response) {
        console.log(response);
        $scope.journal_posts_archives = response.data;
        return $scope;
    });

 $scope.tinymceOptions = {
    onChange: function(e) {
      // put logic here for keypress and cut/paste changes
    },
    inline: false,
    plugins : 'advlist autolink link image lists charmap print preview link media',
    skin: 'lightgray',
    theme : 'modern',
    width : 600,
    height : 300
  };
});
app.controller('LatestArticlesController', function($scope,$rootScope,$http){        
    $http({
        url: base_url+'admin/get_LatestArticles',
        method: "POST"        
    })
    .then(function(response) {
        console.log(response);
        $scope.latest_articles = response.data;
        return $scope;
    });
});
