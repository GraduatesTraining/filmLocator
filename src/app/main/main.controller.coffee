angular.module 'filmlocator'

  .factory 'myFactory', ($http, $q) ->
    service = {}
    baseUrl = 'http://www.omdbapi.com/?y=&plot=short&r=json&t='
    _film = 'The Godfather'
    _finalUrl = ''

    makeUrl = () ->
      _film = _film.split(' ').join '+'
      _finalUrl = baseUrl + _film
      _finalUrl

    service.setFilm = (film) ->
      _film = film
      return

    service.getFilm = () ->
      _film

    service.callIMDB = () ->
      makeUrl()
      deferred = $q.defer()
      $http.get(_finalUrl)
        .success (data) ->
          deferred.resolve(data)
          return
        .error () ->
          deferred.reject('Film not found.')
          return
      deferred.promise
    service

  .controller 'MainController', ($scope, myFactory) ->
    $scope.updateFilm = () ->
      myFactory.setFilm $scope.film
      $scope.submitQuery()
      return
    $scope.submitQuery = () ->
      myFactory.callIMDB()
        .then (data) ->
          if (data.Response isnt 'False')
            $scope.response = true
            $scope.result = data
          else
            $scope.response = false
          return
        , (error) ->
          alert data
          return
      return
    $scope.submitQuery()
