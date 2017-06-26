class Lodging.Views.AirTicketsNewEdit extends Backbone.View

    el: 'body'
    	
    initialize: ->
        $('#air_ticket_arrive_at').datetimepicker()
        $('#air_ticket_leave_at').datetimepicker(
            useCurrent: false
        )
        
        $('#air_ticket_estimated_at').datetimepicker(
            useCurrent: false
        )
        $("#air_ticket_arrive_at").on("dp.change", (e) ->
            $('#air_ticket_leave_at').data("DateTimePicker").minDate(e.date)
            $('#air_ticket_estimated_at').data("DateTimePicker").minDate(e.date.minute(0))
        )
        $("#air_ticket_leave_at").on("dp.change", (e) ->
            $('#air_ticket_arrive_at').data("DateTimePicker").maxDate(e.date)
            $('#air_ticket_estimated_at').data("DateTimePicker").maxDate(e.date)
        )
    