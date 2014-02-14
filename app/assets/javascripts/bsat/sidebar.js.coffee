window.bsat.utils.readyOrPageChange ->
  $('#sidebar-toggle-button').click (e) ->
    e.preventDefault()
    $('body').toggleClass('sidebar-open')
