(->
  ContactService = ($firebaseArray, deviceDetector) ->
    @register = (@name, @email, @message) =>
      @messages = []
      # Conection to the Firebase database
      @database = 'https://flickering-heat-3627.firebaseio.com/contact'
      ref = new Firebase @database
      # Asign the database object to an array
      @messages = $firebaseArray ref
      # Get the device statas via user agent and deviceDetector
      @stats = deviceDetector
      # Add the collected data and the message to the database
      @messages
        .$add {
          name: @name
          email: @email
          message: @message
          os: @stats.os
          os_version: @stats.os_version
          browser: @stats.browser
          browser_version: @stats.browser_version
          device: @stats.device
          timestamp: Firebase.ServerValue.TIMESTAMP
        }
      return

    return

  angular
    .module('filmlocator')
    .service('ContactService', ContactService)
)()
