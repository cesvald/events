class Lodging.Routers.Bookings extends Backbone.Router
	routes:
		"*actions": 'new'

	initialize: ->
		@locations = new Lodging.Collections.Locations()
		@locations.reset( gon.locations )
		$('#booking_host_id').tokenInput('/hosts.json', {
			crossDomain: false,
			addToken: (item) ->
				$('#token-input-booking_host_id').val(item.name)
		})
		if $('#booking_host_id').data('name') isnt ''
			$('#token-input-booking_host_id').val($('#booking_host_id').data('name'))
			$('#booking_host_id').val($('#booking_host_id').data('id'))

	index: ->
		view = new Lodging.Views.BookingsIndex()
		$('body').html(view.render().el)

	new: ->
		view = new Lodging.Views.BookingsNew(collection: @locations)

	edit: (id) ->
		alert('here')
		view = new Lodging.Views.BookingsNew(collection: @locations)