angular.module 'filmlocator'

  .controller 'ContactController',
    ($scope, $mdDialog, $firebaseArray, deviceDetector) ->
      $scope.submit = () ->
        # Conection to the Firebase database
        database = 'https://flickering-heat-3627.firebaseio.com/contact'
        ref = new Firebase (database)
        # Asign the database object to an array
        $scope.messages = $firebaseArray(ref)
        # Get the device statas via user agent and deviceDetector
        stats = deviceDetector
        # Add the collected data and the message to the database
        $scope.messages.$add(
          {
            name: $scope.name,
            email: $scope.email,
            message:$scope.message,
            os: stats.os,
            os_version: stats.os_version,
            browser: stats.browser,
            browser_version: stats.browser_version,
            device: stats.device
            timestamp: Firebase.ServerValue.TIMESTAMP
          }
        )
        # Show a dialog to inform the user when submit is completed
        $mdDialog.show(
          $mdDialog.alert()
            .clickOutsideToClose(true)
            .title('Message sent')
            .ariaLabel('Message sent')
            .textContent("The message have been sent successfuly.
                          You'll receive an answer at #{$scope.email}
                          as soon as possible")
            .ok('Done')
          # Empty the form fields to prevent message spamming
          $scope.name = ''
          $scope.email = ''
          $scope.message = ''
        )
