class Lodging.Routers.Bookings extends Backbone.Router
	routes:
		"*actions": 'new'
		
	initialize: ->
		self = @
		
		$('a[href="' +window.location.hash+ '"]').tab('show')
		$('#navigation a').click( ->
		  location.hash = $(this).attr('aria-controls')
		)
		
		@locations = new Lodging.Collections.Locations()
		if typeof gon isnt 'undefined'
			@locations.reset( gon.locations )

		
		$('.tokenizer-field').each ->
			$(this).tokenizeInput()

		if typeof $('#booking_guest_id').data('guest') isnt 'undefined' && $('#booking_guest_id').data('guest') isnt ''
			guest = $('#booking_guest_id').data('guest')
			$('#token-input-booking_guest_id').val(guest.name + " " + guest.surname + " (" + guest.email + ")")
			$('#token-input-booking_guest_id').addClass('token-occupied')
			$('#booking_guest_id').val(guest.id)

		adminEvd.setupDatePicker()
		
		$('.alert').delay(5000).slideUp(1000)
		
	new: ->
		view = new Lodging.Views.BookingsNew(collection: @locations)

	$.fn.tokenizeInput = ->
		tokenizeField = $(this)
		tokenizeField.tokenInput('/guests.json', {
			crossDomain: false,
			propertyToSearch: ["name", "surname", "email"]
			hintText: "Buscar por nombre o email"
			noResultsText: "No results"
			insertText: "No existe: Adicionar Contacto"
			insertUrl: '/guests/new'
			insertParam: 'email'
			resultsLimit: 1
			uniqueSelection: true
			placeholder: $('#booking_guest_id').attr('placeholder')
			selectionFormat: (item) ->
				return "#{item.name} #{item.surname} (#{item.email})"
			resultsFormatter: (item) ->
				return "<li>" + "<div class='token-result-wrapper'><div>" + item.name + " " + item.surname + "</div><div>" + item.email + "</div></div></li>"
		})