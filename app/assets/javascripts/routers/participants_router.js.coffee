class Lodging.Routers.Participants extends Backbone.Router

    routes:
        "events/:event_id/participants/new": 'newEdit'
        "events/:event_id/participants/:id/edit": 'newEdit'
        "events/:event_id/participants": 'index'
	    
    newEdit: ->
        view = new Lodging.Views.ParticipantsNewEdit()
    
    show: ->
        view = new Lodging.Views.ParticipantsShow()
    
    index: ->
        view = new Lodging.Views.ParticipantsIndex()
	