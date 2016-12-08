angular.module('tmsApp',['ngRoute'])
#为了防止js文件被压缩所以使用数组传递回调函数,以便固定参数名不被替换
.config(['$routeProvider',($routeProvider)->
  $routeProvider.when('/login',{
    templateUrl:'/app/login/login.html'
    controller:'LoginCtrl'
  }).when('/regist',{
    templateUrl: '/app/regist/reg.html',
    controller: 'registCtrl'
  }).when('/', {
    templateUrl: '/app/index/index.html',
    controller: 'indexCtrl'
  })
])
#自动打开登录页面
.run(['$location',($location)->
  $location.path('/login').replace()
])


