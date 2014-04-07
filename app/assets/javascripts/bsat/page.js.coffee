window.bsat.utils.readyOrPageChange ->
  #
  # Detect if there is no page header
  #
  unless $('#page-header')[0]
    $('body').addClass('no-page-header')
