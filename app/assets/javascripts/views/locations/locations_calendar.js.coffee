class Lodging.Views.LocationsCalendar extends Backbone.View

	el: 'body'
	
	events:
		"click  .fa-minus-square-o": 'closeCalendar'
		"click  .fa-plus-square-o": 'openCalendar'
		
	closeCalendar: (event) ->
		$(event.target).closest('.calendar-containor').find('.calendar-wrapper:first').hide()
		$(event.target).removeClass('fa-minus-square-o').addClass('fa-plus-square-o')
		$(event.target).parent().find('.record-link:first').hide()
	
	openCalendar: ->
		$(event.target).closest('.calendar-containor').find('.calendar-wrapper:first').show()
		$(event.target).removeClass('fa-plus-square-o').addClass('fa-minus-square-o')
		$(event.target).parent().find('.record-link:first').show()