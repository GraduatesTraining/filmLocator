(->
  IndexController = ($mdDialog) ->
    init = () =>
      @openMenu = openMenu
      @signDialog = signDialog
      return

    openMenu = ($mdOpenMenu, ev) ->
      originatorEv = ev
      $mdOpenMenu(ev)
      return

    signDialog = (originatorEv) ->
      $mdDialog.show({
        controller: 'DialogController'
        targetEvent: originatorEv
        clickOutsideToClose: true
        templateUrl: 'app/sign/sign.html'
        parent: angular.element(document.body)
      })
      originatorEv = null
      return

    init()
    return

  angular
    .module('filmlocator')
    .controller('IndexController', IndexController)
)()
