# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fixing the turbolinks bug
$(document).on 'ready page:load', ->


  # Reordering

  # Hide the button
  $('.update-order').hide()
  
  # Helper
  fixWidthHelper = (e, ui) ->
    ui.children().each ->
      $(this).width $(this).width()
      return
    ui
  
  # Sortable
  $('.sortable').sortable(helper: fixWidthHelper).disableSelection()
  
  # Show the button
  $('.sortable').sortable stop: ->
    for element, index in $('.order')
      if element.value isnt index.toString()
        $('.update-order').fadeIn()
        break


  # Reorder

  $('.reorder').click ->
    for element, index in $('.order')
      do ->
        element.value = index
