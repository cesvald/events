window.adminEvd = do ->
    
    setDatetimeFormat = (datetimeString) ->
        datetimeSplit = datetimeString.split(" ")
        dateSplit = datetimeSplit[0].split("/")
        newDatetimeString = dateSplit[2] + "-" + dateSplit[1] + "-" + dateSplit[0] + " " + datetimeSplit[1] + ":00"
        return newDatetimeString
        
    publicContent =
        setDatetimeFormat: setDatetimeFormat
    
    return publicContent
        