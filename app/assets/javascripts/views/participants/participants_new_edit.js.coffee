class Lodging.Views.ParticipantsNewEdit extends Backbone.View

	el: 'body'

	events:
		"change #modality_id": 'populateSpacesList'
		
	initialize: ->
		$('#participant_guest_id').tokenizeInput()
		
		if $('#participant_guest_id').data('guest') isnt null && $('#participant_guest_id').data('guest') isnt ''
			guest = $('#participant_guest_id').data('guest')
			$('#token-input-participant_guest_id').val(guest.name + " " + guest.surname + " (" + guest.email + ")")
			$('#token-input-participant_guest_id').attr('readonly', 'readonly')
			$('#token-input-participant_guest_id').addClass('token-occupied')
			$('#participant_guest_id').val(guest.id)
			
		
		@modalities = new Lodging.Collections.Modalities()
		@modalities.reset(gon.modalities)
		
	populateSpacesList: (event) ->
		modality_id = event.target.value
		if modality_id is ''
			$('#participant_space_id').attr('disabled', 'disabled')
			$('#participant_space_id').val('')
			$('#participant_space_id').trigger('change')
		else
			$('#participant_space_id').removeAttr('disabled')
			$('#participant_space_id').html('<option value=""></option>')
			$('#participant_space_id').trigger('change')
			@modality = @modalities.get(modality_id)
			@spaces = new Lodging.Collections.Spaces()
			@spaces.reset(@modality.get('spaces'))
			@spaces.each(@appendSpaceOption)
	
	appendSpaceOption: (space)->
		view = new Lodging.Views.SpacesOption(model: space)
		$('#participant_space_id').append(view.render().el)
		
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