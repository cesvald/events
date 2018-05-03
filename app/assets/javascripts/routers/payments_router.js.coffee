class Lodging.Routers.Payments extends Backbone.Router

    routes:
        "events/:event_id/participants/:participant_id/payments/new": 'newEdit'
        "events/:event_id/participants/:participant_id/payments/:id/edit": 'newEdit'
        "bookings/:booking_id/payments/new": 'newEdit'
        "bookings/:booking_id/payments/:id/edit": 'newEdit'
	    
    newEdit: ->
        view = new Lodging.Views.PaymentsNewEdit()
	