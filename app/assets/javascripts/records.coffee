# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	# Disappearing notices
	$('.alert').delay(3000).slideUp()

# Fix turbolinks bug
$(document).ready(ready)
$(document).on('page:load', ready)