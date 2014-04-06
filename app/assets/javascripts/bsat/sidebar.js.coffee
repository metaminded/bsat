window.bsat.utils.readyOrPageChange ->
  #
  # Toggle sidebar open/close state when the user
  # clicks on sidebar toggle button
  #
  $('#sidebar-toggle-button').click (e) ->
    e.preventDefault()
    $('body').toggleClass('sidebar-close')

  #
  # Detect if there is no sidebar
  #
  unless $('#sidebar')[0]
    $('body').addClass('no-sidebar')

  #
  # Use IScroll for scrolling the sidebar and content area
  #
  for selector in ['#sidebar', '#content']
    new IScroll(selector, {
      scrollbars: true,
      fadeScrollbars: true,
      mouseWheel: true
    }) if $(selector)[0]

