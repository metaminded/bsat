# setElementHeight = (element) ->
#   element.each (i, element) ->
#     element = $(element)
#     element.css('min-height', "#{element.parent().outerHeight() - element.position().top}px")

# window.bsat.utils.readyOrPageChange ->
#   element = $('*[data=bsat-full-height]')
#   setElementHeight(element)
#   $(window).resize -> setElementHeight(element)
