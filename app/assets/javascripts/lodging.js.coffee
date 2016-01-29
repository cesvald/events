window.Lodging =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Lodging.Routers.Bookings()
  	Backbone.history.stop()
  	Backbone.history.start( pushState: true )

ready = ->
	Lodging.initialize()

$(document).ready ->
  ready()

$(document).on('page:load', ready)
