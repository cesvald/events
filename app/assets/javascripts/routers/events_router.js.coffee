class Lodging.Routers.Events extends Backbone.Router

    routes:
        "events/new": 'newEdit'
        "events/newEdit": 'newEdit'
	
    newEdit: ->
        view = new Lodging.Views.EventsNewEdit()
	