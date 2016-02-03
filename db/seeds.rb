# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

['Sebastian', 'Valentina', 'Maria Teresa', 'Florencia'].each do |name|
	Guest.find_or_create_by name: name, surname: 'evd', email: "#{name}@gmail.com"
end

ashram = Location.create name: 'Ashram'
morada = Location.create name: 'Morada'

morada_house = House.create location: morada, name: 'Casa 1'

['Muladhara', 'Swadisthana', 'Manipura', 'Anahata', 'Vishuda', 'Ajna'].each do |name|
	room = Room.create house: morada_house, name: name
	if room.name == 'Muladhara' || room.name == 'Manipura'
		[1, 2].each do |number|
			Bed.create room: room, number: number
		end
	end
	if room.name == 'Swadisthana' || room.name == 'Anahata'
		[1, 2, 3].each do |number|
			Bed.create room: room, number: number
		end
	end
	if room.name == 'Vishuda' || room.name == 'Ajna'
		[1, 2, 3, 4].each do |number|
			Bed.create room: room, number: number
		end
	end
end

morada_house = House.create location: morada, name: 'Casa 2'
['A', 'B', 'C', 'D'].each do |name|
	room = Room.create house: morada_house, name: name
	[1, 2].each do |number|
		Bed.create room: room, number: number
	end
end

['Durga', 'Ganesha', 'Gauri', 'Kali', 'Yoga Shala'].each do |name|
	house = House.create location: ashram, name: name
	
	['A', 'B', 'C', 'D'].each do |name|
		room = Room.create house: house, name: name
		if (house.name == 'Durga') || (house.name == 'Kali' && (room.name == 'A' || room.name == 'D')) || (house.name == 'Ganesha' && room.name != 'C')
			[1, 2].each do |number|
				Bed.create room: room, number: number
			end
		end
		if (house.name == 'Ganesha' && room.name == 'C') || (house.name == 'Kali' && (room.name == 'B' || room.name == 'C')) || (house.name == 'Yoga Shala' && room.name != 'D')
			[1, 2, 3].each do |number|
				Bed.create room: room, number: number
			end
		end
		if house.name == 'Gauri' && room.name == 'A'
			[1, 2, 3, 4].each do |number|
				Bed.create room: room, number: number
			end
		end
	end
end