class Lodging.Routers.Participants extends Backbone.Router

    routes:
        "events/:event_id/participants/new": 'newEdit'
        "events/:event_id/participants/:id/edit": 'newEdit'
	
    newEdit: ->
        view = new Lodging.Views.ParticipantsNewEdit()
	