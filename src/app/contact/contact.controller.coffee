angular.module 'filmlocator'

  .controller 'ContactController', ($scope, $mdDialog) ->
    $scope.submit = () ->
      done = $mdDialog.confirm()
        .clickOutsideToClose(true)
        .title('Message sent')
        .textContent("The message have been sent successfuly. You'll receive an answer at #{$scope.email} as soon as possible")
        .ok('Done')
      $mdDialog.show(done).then = () ->
        $scope.name = ''
        $scope.email = ''
        $scope.message = ''
