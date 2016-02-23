(->
  ContactController = (ContactService, $mdDialog) ->
    init = () =>
      @reset = reset
      @submit = submit
      @dialog = dialog
      @reset()
      return

    reset = () =>
      @name = ''
      @email = ''
      @message = ''
      return

    submit = () =>
      ContactService.register(@name, @email, @message)
      @dialog()
      return

    dialog = (success) =>
    # Show a dialog to inform the user when submit is completed
      $mdDialog.show(
        $mdDialog.alert()
          .clickOutsideToClose(true)
          .title('Message sent')
          .ariaLabel('Message sent')
          .textContent("The message have been sent successfuly.
                        You'll receive an answer at #{@email}
                        as soon as possible")
          .ok('Done')
        # Empty the form fields to prevent message spamming
        @reset()
      )
      return

    init()
    return

  angular
    .module('filmlocator')
    .controller('ContactController', ContactController)
)()
