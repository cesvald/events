# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

ashram = Location.find_by_name('Ashram')
morada = Location.find_by_name('Morada')

morada_house = House.find_by_name('Casa 1')

['Muladhara', 'Swadisthana', 'Manipura', 'Anahata', 'Vishuda', 'Ajna'].each do |name|
	room = morada_house.rooms.find_by_name(name)
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

morada_house = House.find_by_name('Casa 2')
['A', 'B', 'C', 'D'].each do |name|
	room = morada_house.rooms.find_by_name(name)
	[1, 2].each do |number|
		Bed.create room: room, number: number
	end
end

['Durga', 'Ganesha', 'Gauri', 'Kali', 'Yoga Shala', 'Carpas'].each do |name|
	house = House.find_by_name(name)
	
	['A', 'B', 'C', 'D'].each do |name|
		room = house.rooms.find_by_name(name)
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

	if house.name == 'Carpas'
		(1..20).each do |room_number|
			p 'ROOM NUMBER IS'
			p room_number.to_s
			room = house.rooms.find_by_name(room_number.to_s)
			p 'room found fine'
			p room.id
			[1,2,3].each do |number|
				Bed.create room: room, number: number
			end
		end
	end
end

