(->
  myFactory = ($http, $q) ->

    baseUrl = 'http://www.omdbapi.com/?y=&plot=short&r=json&t='
    filmReq = 'Jurassic Park'
    finalUrl = ''

    return{
      setFilm: (film) ->
        filmReq = film
        return

      getFilm: () ->
        filmReq.split('+').join ' '

      callIMDB: () ->
        makeUrl = () ->
          filmReq = filmReq.split(' ').join '+'
          finalUrl = baseUrl + filmReq
          finalUrl

        makeUrl()
        deferred = $q.defer()
        $http.get(finalUrl)
          .success (data) ->
            deferred.resolve(data)
            return
          .error () ->
            deferred.reject('Film not found.')
            return
        deferred.promise
    }

  angular
    .module('filmlocator')
    .factory('myFactory', myFactory)
)()
