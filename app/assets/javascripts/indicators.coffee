# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fixing the turbolinks bug
$(document).on 'ready page:load', ->


  # Reordering

  # Helper
  fixWidthHelper = (e, ui) ->
    ui.children().each ->
      $(this).width $(this).width()
      return
    ui
  
  # Sortable
  $('.sortable').sortable(helper: fixWidthHelper).disableSelection()

  # Reorder
  $('.reorder').click ->
    for element, index in $('.order')
      do ->
        element.value = index
