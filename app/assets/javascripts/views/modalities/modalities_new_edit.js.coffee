class Lodging.Views.ModalitiesNewEdit extends Backbone.View

    el: 'body'
    	
    initialize: ->
        
        $('#modality_start_at').datetimepicker(
            format: 'DD/MM/Y'
        )
        $('#modality_end_at').datetimepicker(
            format: 'DD/MM/Y'
            useCurrent: false
        )
        $("#modality_start_at").on("dp.change", (e) ->
            $('#modality_end_at').data("DateTimePicker").minDate(e.date)
        )
        $("#modality_end_at").on("dp.change", (e) ->
            $('#modality_start_at').data("DateTimePicker").maxDate(e.date)
        )
       