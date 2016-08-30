# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fixing the turbolinks bug
$(document).on 'ready page:load', ->

  # Disappearing notices
  $('.notice').delay(3000).slideUp()
  
  # Dynamic companies selector
  $('.select-period-gaap').on 'change', (event) ->
    period_id = $('select#record_period_id').val()
    gaap_id = $('select#record_gaap_id').val()

    # Change params of 'New company' link
    params = $.param( { period: period_id, gaap: gaap_id, new_record: true } )
    $('.new-company').attr('href', '/companies/new?' + params)

    # Change companies selector
    $.ajax
    	url: '/records/fetch_companies'
    	data: { period: period_id, gaap: gaap_id }
    return

  # Evaluate user's equations
  $('.value').on 'change', (event) ->
    value = $(this).val()
    unless $.isNumeric(value)
      filtered = value.replace(/[^-+*\/\d.()]/g,'')
      result = eval(filtered).toFixed(1)
      # Fade out equation and fade in the result
      $(this).fadeOut ->
        $(this).val(result).fadeIn()
        return
