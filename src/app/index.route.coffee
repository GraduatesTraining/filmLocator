(->
  config = ($routeProvider) ->
    $routeProvider
      .when '/', {
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
      }
      .when '/user', {
        templateUrl: 'app/user/user.html'
        controller: 'UserController'
        controllerAs: 'user'
      }
      .when '/contact', {
        templateUrl: 'app/contact/contact.html'
        controller: 'ContactController'
        controllerAs: 'contact'
      }
      .otherwise
        redirectTo: '/'
    return

  angular
    .module('filmlocator')
    .config(config)
)()
