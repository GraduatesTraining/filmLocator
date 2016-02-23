angular.module 'filmlocator'

.controller 'DialogController', ($scope, $mdDialog, $firebaseAuth) ->
  $scope.reset = () ->
    $scope.email = ''
    $scope.password = ''
    $scope.passwordConfirm = ''
  $scope.login = () ->
    ref = new Firebase('https://flickering-heat-3627.firebaseio.com')
    ref.authWithPassword({
      email: $scope.email
      password: $scope.password
    }, (error, authData) ->
      if error
        console.log("Login failed", error)
      else
        console.log("Authenticated successfully", authData)
    )
    $mdDialog.hide()
    return
  if $scope.password is ""
    $scope.checkPass = "The passwords don't match!"
