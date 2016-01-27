window.Lodging =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Lodging.Routers.Bookings()
  	Backbone.history.start( pushState: true )

$(document).ready ->
  Lodging.initialize()
