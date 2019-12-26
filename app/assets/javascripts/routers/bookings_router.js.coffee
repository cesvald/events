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

		$('.hidden_field_date').each( ->
			if this.value != ''
				dateArray = $(this).val().split("-")
				dateField = $(this).data('date-field')
				$(dateField).val(dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0])
		)
		
		$('.start-datepicker').each( ->
			self.updateEndDate($(this)) if this.val isnt ''
		)
		
		$('.datepicker').datepicker().on('change', (e) ->
			if typeof $(e.target).data('end-datepicker') != 'undefined'
				self.updateEndDate($(e.target))
			self.updateHiddenDate($(e.target))
		)

		$('.datepicker').on('input', (e) ->
			self.updateHiddenDate($(e.target)) if this.value == ''
		)
		
		$('.alert').delay(5000).slideUp(1000)
   
	updateEndDate: (datepicker) ->
		dateArray = datepicker.val().split("/")
		date = new Date(dateArray[2], dateArray[1] - 1, dateArray[0])
		endDatePicker = datepicker.data("end-datepicker") 
		$(endDatePicker).datepicker('setStartDate', date)
	
	updateHiddenDate: (datepicker) ->
		hiddenDate = datepicker.data('hidden-datepicker');
		if datepicker.val() == ''
			$(hiddenDate).val('')
		else
			dateArray = datepicker.val().split("/")
			$(hiddenDate).val(dateArray[2] + "-" + dateArray[1] + "-" + dateArray[0])
		
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