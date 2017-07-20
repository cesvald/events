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
  	Backbone.history.stop()
  	Backbone.history.start( pushState: true )

ready = ->
	Lodging.initialize()

$(document).ready ->
  ready()

$(document).on('page:load', ready)
