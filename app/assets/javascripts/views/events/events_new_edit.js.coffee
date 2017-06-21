class Lodging.Views.EventsNewEdit extends Backbone.View

    el: 'body'
    	
    initialize: ->
        
        $('#event_start_at').datetimepicker(
            format: 'DD/MM/Y'
        )
        $('#event_end_at').datetimepicker(
            format: 'DD/MM/Y'
            useCurrent: false
        )
        $("#event_start_at").on("dp.change", (e) ->
            $('#event_end_at').data("DateTimePicker").minDate(e.date)
        )
        $("#event_end_at").on("dp.change", (e) ->
            $('#event_start_at').data("DateTimePicker").maxDate(e.date)
        )
       