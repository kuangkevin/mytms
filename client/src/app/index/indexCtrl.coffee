angular.module('tmsApp')
.controller('indexCtrl',['$scope',($scope) ->
  console.log('进入主页')
  $scope.task = {
    description:'',
    checked:false
  }
  $scope.taskList = []

  $scope.addTask = ->
    console.log($scope.task)
    task = angular.copy($scope.task)
    task.checked = false
    $scope.taskList.push(task)
    $scope.task.description = ''
    return
  1
])