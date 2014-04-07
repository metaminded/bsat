window.bsat.utils.readyOrPageChange ->
  #
  # Setup sidebar open/close state when the user
  # clicks on sidebar toggle button. The sidebar
  # gets closed on small devices using media queries,
  # so we need to take this into account.
  #
  $('#sidebar-toggle-button').click (e) ->
    e.preventDefault()
    if $(window).width() < 768
      $('body').toggleClass('sidebar-open')
      $('body').removeClass('sidebar-close')
    else
      $('body').removeClass('sidebar-open')
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

