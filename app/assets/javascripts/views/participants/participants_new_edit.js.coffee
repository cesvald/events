class Lodging.Views.ParticipantsNewEdit extends Backbone.View

	el: 'body'

	events:
		"change .modality_select": 'populateSpacesList'
		"click #clean-guest-input-btn": 'cleanTokenInput'
		
	initialize: ->
		$('#participant_guest_id').tokenizeInput()
		
		if typeof $('#participant_guest_id').data('guest') isnt "undefined" && $('#participant_guest_id').data('guest') isnt null && $('#participant_guest_id').data('guest') isnt ''
			guest = $('#participant_guest_id').data('guest')
			$('#token-input-participant_guest_id').val(guest.name + " " + guest.surname + " (" + guest.email + ")")
			$('#token-input-participant_guest_id').attr('readonly', 'readonly')
			$('#token-input-participant_guest_id').addClass('token-occupied')
			$('#participant_guest_id').val(guest.id)
			
		$('#token-input-participant_guest_id').attr('required', 'required')
		
		@modalities = new Lodging.Collections.Modalities()
		@modalities.reset(gon.modalities)
		
	populateSpacesList: (event) ->
		modality_id = event.target.value
		participantSelect = $(event.target).closest('.fields').find('.space_select')
		if modality_id is ''
			participantSelect.attr('disabled', 'disabled')
			participantSelect.val('')
			participantSelect.trigger('change')
		else
			participantSelect.removeAttr('disabled')
			participantSelect.html('<option value=""></option>')
			participantSelect.trigger('change')
			participantSelect.addClass('active-space')
			@modality = @modalities.get(modality_id)
			@spaces = new Lodging.Collections.Spaces()
			@spaces.reset(@modality.get('spaces'))
			@spaces.each(@appendSpaceOption)
			participantSelect.removeClass('active-space')
	
	cleanTokenInput: () ->
		$('#token-input-participant_guest_id').removeClass('token-occupied')
		$('#token-input-participant_guest_id').val('')
		$('#token-input-participant_guest_id').focus()
		$('#participant_guest_id').val('')
		
	appendSpaceOption: (space)->
		console.log space
		view = new Lodging.Views.SpacesOption(model: space)
		$('.active-space').append(view.render().el)
		
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
		
	