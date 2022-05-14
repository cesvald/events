class Lodging.Views.LocationsCalendar extends Backbone.View

	el: 'body'
	
	events:
		"click  .close-calendar": 'closeCalendar'
		"click  .open-calendar": 'openCalendar'
		
	closeCalendar: (event) ->
		if $(event.target).hasClass('close-calendar')
			target = $(event.target)
		else
			target = $(event.target).closest('.close-calendar')
		
		target.closest('.calendar-containor').find('.calendar-wrapper:first').hide()
		target.removeClass('close-calendar').addClass('open-calendar')
		target.closest('.calendar-containor').find('.glyphicon-minus').removeClass('glyphicon-minus').addClass('glyphicon-plus')
		target.closest('.calendar-containor').find('.fa-minus-square-o').removeClass('fa-minus-square-o').addClass('fa-plus-square-o')
		target.parent().find('.record-link:first').hide()
	
	openCalendar: ->
		if $(event.target).hasClass('open-calendar')
			target = $(event.target)
		else
			target = $(event.target).closest('.open-calendar')
		target.closest('.calendar-containor').find('.calendar-wrapper:first').show()
		target.removeClass('open-calendar').addClass('close-calendar')
		target.find('.glyphicon-plus').removeClass('glyphicon-plus').addClass('glyphicon-minus')
		target.find('.fa-plus-square-o').removeClass('fa-plus-square-o').addClass('fa-minus-square-o')
		target.parent().find('.record-link:first').show()