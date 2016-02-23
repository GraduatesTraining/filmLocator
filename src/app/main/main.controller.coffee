(->
  MainController = (myFactory) ->
    init = () =>
      @film = myFactory.getFilm()
      @submitQuery = submitQuery
      @updateFilm = updateFilm
      @submitQuery()
      return

    submitQuery = () =>
      myFactory
        .callIMDB()
        .then (data) =>
          if (data.Response isnt 'False')
            @response = true
            @result = data
          else
            @response = false
            return
      return

    updateFilm = () =>
      myFactory
        .setFilm @film
      @submitQuery()
      return

    init()
    return

  angular
    .module('filmlocator')
    .controller('MainController', MainController)
)()
