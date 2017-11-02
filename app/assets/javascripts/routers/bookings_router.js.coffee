class Lodging.Routers.Bookings extends Backbone.Router
	routes:
		"*actions": 'new'

	initialize: ->
		self = @

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

		$('.datepicker').datepicker({
	    	format: 'dd/mm/yyyy'
		})

		$('.start-datepicker').each( ->
			self.updateEndDate($(this)) if this.val isnt ''
		)
		
		$('.start-datepicker').datepicker().on('change', (e) ->
			self.updateEndDate($(e.target))
		)

		$('.alert').delay(5000).slideUp(1000)

	updateEndDate: (datepicker) ->
		dateArray = datepicker.val().split("-")
		date = new Date(dateArray[0], dateArray[1] - 1, dateArray[2])
		endDatePicker = datepicker.data("end-datepicker")
		$(endDatePicker).datepicker('setStartDate', date)

	new: ->
		view = new Lodging.Views.BookingsNew(collection: @locations)

	$.fn.tokenizeInput = ->
		tokenizeField = $(this)
		tokenizeField.tokenInput('/guests.json', {
			crossDomain: false,
			propertyToSearch: ["name", "surname", "email"]
			hintText: "Search by name or email"
			noResultsText: "No results"
			insertText: "Not found: Add Guest"
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