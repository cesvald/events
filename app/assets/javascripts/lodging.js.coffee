window.Lodging =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	controller = $('body').data('controller')
  	new Lodging.Routers.Bookings() if controller == "bookings"
  	new Lodging.Routers.Participants() if controller == "participants"
  	new Lodging.Routers.Modalities() if controller == "modalities"
  	new Lodging.Routers.AirTickets() if controller == "air_tickets"
  	new Lodging.Routers.Stays() if controller == "stays"
  	new Lodging.Routers.Payments() if controller == "payments"
  	new Lodging.Routers.Events() if controller == "events"
  	new Lodging.Routers.Locations() if controller == "locations"
  	
  	Backbone.history.stop()
  	Backbone.history.start( pushState: true )

#$(document).ready ->
#	console.log 'doc ready'
#	Iniciados.singleInitialize()

$(document).on "turbolinks:load", ->
	Lodging.initialize()
