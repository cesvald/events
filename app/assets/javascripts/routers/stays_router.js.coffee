class Lodging.Routers.Stays extends Backbone.Router

    routes:
        "events/:event_id/participants/:participant_id/stays/new": 'newEdit'
        "events/:event_id/participants/:participant_id/stays/:id/edit": 'newEdit'
	    
    newEdit: ->
        view = new Lodging.Views.StaysNewEdit()
	