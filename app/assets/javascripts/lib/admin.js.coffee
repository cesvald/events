window.adminEvd = do ->
    
  setDatetimeFormat = (datetimeString) ->
    datetimeSplit = datetimeString.split(" ")
    dateSplit = datetimeSplit[0].split("/")
    newDatetimeString = dateSplit[2] + "-" + dateSplit[1] + "-" + dateSplit[0] + " " + datetimeSplit[1] + ":00"
    return newDatetimeString
  
  setupDatePicker = ->
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    $('.hidden_field_date').each( ->
      if this.value != ''
        dateArray = $(this).val().split("-")
        dateField = $(this).data('date-field')
        $(dateField).val(dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0])
    )
    
    $('.start-datepicker').each( ->
      updateEndDate($(this)) if this.val isnt ''
    )
    
    $('.datepicker').datepicker().on('change', (e) ->
      if typeof $(e.target).data('end-datepicker') != 'undefined'
        updateEndDate($(e.target))
      updateHiddenDate($(e.target))
    )

    $('.datepicker').on('input', (e) ->
      updateHiddenDate($(e.target)) if this.value == ''
    )
   
  updateEndDate = (datepicker) ->
    dateArray = datepicker.val().split("/")
    date = new Date(dateArray[2], dateArray[1] - 1, dateArray[0])
    endDatePicker = datepicker.data("end-datepicker") 
    $(endDatePicker).datepicker('setStartDate', date)
  
  updateHiddenDate = (datepicker) ->
    hiddenDate = datepicker.data('hidden-datepicker');
    if datepicker.val() == ''
      $(hiddenDate).val('')
    else
      dateArray = datepicker.val().split("/")
      $(hiddenDate).val(dateArray[2] + "-" + dateArray[1] + "-" + dateArray[0])
        
  publicContent =
    setupDatePicker: setupDatePicker
  
  return publicContent
        