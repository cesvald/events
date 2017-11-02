class Lodging.Routers.Locations extends Backbone.Router

    routes:
        "locations/calendar": 'calendar'
	
    calendar: ->
        view = new Lodging.Views.LocationsCalendar()
	