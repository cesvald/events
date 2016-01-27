class Lodging.Routers.Bookings extends Backbone.Router
	routes:
		'': 'index'
		'bookings/new': 'new'

	initialize: ->
		@locations = new Lodging.Collections.Locations()
		@locations.reset( gon.locations )

	index: ->
		view = new Lodging.Views.BookingsIndex()
		$('body').html(view.render().el)

	new: ->
		view = new Lodging.Views.BookingsNew(collection: @locations)