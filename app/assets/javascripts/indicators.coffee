# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fixing the turbolinks bug
$(document).on 'ready page:load', ->

	# Sortable
	$ ->
	  $('.sortable').sortable()
	  $('.sortable').disableSelection()
	  return