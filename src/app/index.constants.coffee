(->
  malarkey = () ->
    malarkey
  moment = () ->
    moment

  angular
    .module('filmlocator')
    .constant(malarkey)
    .constant(moment)
)()
