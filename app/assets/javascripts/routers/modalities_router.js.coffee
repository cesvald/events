class Lodging.Routers.Modalities extends Backbone.Router

    routes:
        "events/:event_id/modalities/new": 'newEdit'
        "modalities/:id/edit": 'newEdit'
	
    newEdit: ->
        view = new Lodging.Views.ModalitiesNewEdit()
	