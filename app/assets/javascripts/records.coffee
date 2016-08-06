# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fixing the turbolinks bug
$(document).on 'ready page:load', ->

  # Disappearing notices
  $('.notice').delay(3000).slideUp()
  
  #
  $('.select-period-gaap').on 'change', (event) ->
    period_id = $('select#record_period_id').val()
    gaap_id = $('select#record_gaap_id').val()
    $.ajax
    	url: '/fetch_companies'
    	data: { period: period_id, gaap: gaap_id }
    return
