class Lodging.Views.StaysNewEdit extends Backbone.View

    el: 'body'
    	
    initialize: ->
        
        $('#stay_start_at').datetimepicker(
            format: 'DD/MM/Y'
        )
        $('#stay_end_at').datetimepicker(
            format: 'DD/MM/Y'
            useCurrent: false
        )
        $("#stay_start_at").on("dp.change", (e) ->
            $('#stay_end_at').data("DateTimePicker").minDate(e.date)
        )
        $("#stay_end_at").on("dp.change", (e) ->
            $('#stay_start_at').data("DateTimePicker").maxDate(e.date)
        )
       