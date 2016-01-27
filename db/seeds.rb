# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create email: 'valderramago@gmail.com', password: 'sbabaji7'

['Sebastian', 'Valentina', 'Maria Teresa', 'Florencia'].each do |name|
	Host.find_or_create_by name: name
end

ashram = Location.create name: 'Ashram'
morada = Location.create name: 'Morada'

morada_house = House.create location: morada, name: 'Casa 1'
['Muladara', 'Swadistana', 'Manipura', 'Anahata', 'Vishuda', 'Agna'].each do |name|
	room = Room.create house: morada_house, name: name
	[1, 2, 3, 4].each do |number|
		Bed.create room: room, number: number
	end
end

morada_house = House.create location: morada, name: 'Casa 2'
['A', 'B', 'C', 'D'].each do |name|
	room = Room.create house: morada_house, name: name
	[1, 2, 3, 4].each do |number|
		Bed.create room: room, number: number
	end
end

['Kali', 'Durga', 'Gauri', 'Yoga Shala'].each do |name|
	house = House.create location: ashram, name: name
	['A', 'B', 'C', 'D'].each do |name|
		room = Room.create house: house, name: name
		[1, 2, 3, 4].each do |number|
			Bed.create room: room, number: number
		end
	end
end