(->
  run = ($log) ->
    $log
      .debug 'runBlock end'
    return

  angular
    .module('filmlocator')
    .run(run)
)()
