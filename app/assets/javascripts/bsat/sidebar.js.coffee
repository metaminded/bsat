window.bsat.utils.readyOrPageChange ->
  #
  # Setup sidebar open/close state when the user
  # clicks on sidebar toggle button. The sidebar
  # gets closed on small devices using media queries,
  # so we need to take this into account.
  #
  $('#left-sidebar-toggle-button').click (e) ->
    e.preventDefault()
    if $(window).width() <= 768
      $('body').toggleClass('left-sidebar-open')
      $('body').removeClass('left-sidebar-close')
    else
      $('body').removeClass('left-sidebar-open')
      $('body').toggleClass('left-sidebar-close')


  $('#right-sidebar-toggle-button').click (e) ->
    e.preventDefault()
    if $(window).width() <= 768
      $('body').toggleClass('right-sidebar-open')
      $('body').removeClass('right-sidebar-close')
    else
      $('body').removeClass('right-sidebar-open')
      $('body').toggleClass('right-sidebar-close')

  #
  # Detect if there is no sidebar
  #
  unless $('#left-sidebar-wrapper')[0]
    $('body').addClass('no-left-sidebar')
  unless $('#right-sidebar-wrapper')[0]
    $('body').addClass('no-right-sidebar')

  #
  # Use IScroll for scrolling the sidebar
  #
  selector = '#sidebar'
  new IScroll(selector, {
    scrollbars: true,
    fadeScrollbars: true,
    mouseWheel: true,
    click: true
  }) if $(selector)[0]

  #
  # Handle Subnavigation
  #

  open_subnav = (e) ->
    path = $(e.currentTarget).attr 'href'
    $(e.currentTarget).parents('nav#sidebar').find('ul.nav').addClass 'hidden'
    $(e.currentTarget).parents('nav#sidebar').find(path).removeClass 'hidden'

  close_subnav = (e) ->
    path = $(e.currentTarget).parents('ul').first().attr 'id'
    $(e.currentTarget).parents('nav#sidebar').find('ul.nav').addClass 'hidden'
    $(e.currentTarget).parents('nav#sidebar').find("a[href=##{path}]").parents('ul.nav').removeClass 'hidden'

  $(document).on 'click', '#sidebar .subnav-toggle', open_subnav
  $(document).on 'tap', '#sidebar .subnav-toggle', open_subnav

  $(document).on 'click', '#sidebar .subnav-back', close_subnav
  $(document).on 'tap', '#sidebar .subnav-back', close_subnav

  path = $('nav#sidebar').find('li.active a').parents('ul').attr('id')
  if path
    $('nav#sidebar').has('.subnav-menu').find('ul.nav').addClass 'hidden'
    $('nav#sidebar').find("##{path}").removeClass 'hidden'
