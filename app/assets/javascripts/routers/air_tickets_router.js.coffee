class Lodging.Routers.AirTickets extends Backbone.Router

    routes:
        "events/:event_id/participants/:participant_id/air_tickets/new": 'newEdit'
        "events/:event_id/participants/:participant_id/air_tickets/:id/edit": 'newEdit'
	    
    newEdit: ->
        view = new Lodging.Views.AirTicketsNewEdit()
	