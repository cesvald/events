class Lodging.Views.ParticipantsIndex extends Backbone.View

	el: 'body'

	events:
		"change #by_modality": 'populateSpacesList'
		"click #clean-guest-btn" : 'cleanTokenInput'
		
	initialize: ->
		$('#by_guest').tokenizeInput()
		if typeof $('#by_guest').data('guest') isnt 'undefined' and $('#by_guest').data('guest') isnt null and $('#by_guest').data('guest') isnt ''
			guest = $('#by_guest').data('guest')
			$('#token-input-by_guest').val(guest.name + " " + guest.surname + " (" + guest.email + ")")
			$('#token-input-by_guest').attr('readonly', 'readonly')
			$('#token-input-by_guest').addClass('token-occupied')
			$('#by_guest').val(guest.id)
			
		
		@modalities = new Lodging.Collections.Modalities()
		@modalities.reset(gon.modalities)
		
		if $('#by_modality').val() != ''
		    $('#by_modality').trigger('change')
		    $('#by_space').val($('#by_space').data('space'))
		    
		
		
	populateSpacesList: (event) ->
		modality_id = event.target.value
		if modality_id is ''
			$('#by_space').attr('disabled', 'disabled')
			$('#by_space').val('')
			$('#by_space').trigger('change')
		else
			$('#by_space').removeAttr('disabled')
			$('#by_space').html('<option value=""></option>')
			$('#by_space').trigger('change')
			@modality = @modalities.get(modality_id)
			@spaces = new Lodging.Collections.Spaces()
			@spaces.reset(@modality.get('spaces'))
			@spaces.each(@appendSpaceOption)
	
	appendSpaceOption: (space)->
		view = new Lodging.Views.SpacesOption(model: space)
		$('#by_space').append(view.render().el)
		
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
	
	cleanTokenInput: ->
		$('#token-input-by_guest').removeAttr('readonly').removeClass('token-occupied')
		$('#token-input-by_guest').val('')
		$('#token-input-by_guest').focus()
		$('#by_guest').val('')