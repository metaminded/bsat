window.bsat       ?= {}
window.bsat.utils ?= {}

window.bsat.utils.readyOrPageChange ?= (event_handler) =>
  # http://stackoverflow.com/questions/5574842/best-way-to-check-for-ie-less-than-9-in-javascript-without-library
  recentBrowser = window.document.addEventListener?

  # needed to ensure execution of event handlers assigned in body scripts, no matter what
  $.ready.promise().done(event_handler)

  # trigger event handler on page loads (I hope this performs like page:change, but without the problems)
  $(window).on('page:load', event_handler) if window.Turbolinks && recentBrowser
