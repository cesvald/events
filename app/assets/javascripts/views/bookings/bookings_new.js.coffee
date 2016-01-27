class Lodging.Views.BookingsNew extends Backbone.View

	el: 'body'

	events:
		"change #location_id": 'populateHousesList'
		"change #house_id": 'populateRoomsList'
		"change #room_id": 'populateBedsList'

	populateHousesList: ->
		location_id = $('#location_id').val()
		if location_id is ''
			$('#house_id').attr('disabled', 'disabled')
			$('#house_id').val('')
			$('#house_id').trigger('change')
		else
			$('#house_id').removeAttr('disabled')
			$('#house_id').html('<option value=""></option>')
			$('#house_id').trigger('change')
			@location = @collection.get(location_id)
			@houses = new Lodging.Collections.Houses()
			@houses.reset(@location.get('houses'))
			@houses.each(@appendHouseOption)

	appendHouseOption: (house) ->
		view = new Lodging.Views.HousesOption(model: house)
		$('#house_id').append(view.render().el)

	populateRoomsList: ->
		house_id = $('#house_id').val()
		if house_id is ''
			$('#room_id').attr('disabled', 'disabled')
			$('#room_id').val('')
			$('#room_id').trigger('change')
		else
			$('#room_id').removeAttr('disabled')
			$('#room_id').html('<option value=""></option>')
			$('#room_id').trigger('change')
			@house = @houses.get(house_id)
			@rooms = new Lodging.Collections.Rooms()
			@rooms.reset(@house.get('rooms'))
			@rooms.each(@appendRoomOption)

	appendRoomOption: (room) ->
		view = new Lodging.Views.RoomsOption(model: room)
		$('#room_id').append(view.render().el)

	populateBedsList: ->
		room_id = $('#room_id').val()
		if room_id is ''
			$('#booking_bed_id').attr('disabled', 'disabled')
			$('#booking_bed_id').val('')
			$('#booking_bed_id').trigger('change')
		else
			$('#booking_bed_id').removeAttr('disabled')
			$('#booking_bed_id').html('<option value=""></option>')
			$('#booking_bed_id').trigger('change')
			@room = @rooms.get($('#room_id').val())
			@beds = new Lodging.Collections.Beds()
			console.log(@room)
			@beds.reset(@room.get('beds'))
			@beds.each(@appendBedOption)

	appendBedOption: (bed) ->
		console.log(bed)
		view = new Lodging.Views.BedsOption(model: bed)
		$('#booking_bed_id').append(view.render().el)


