json.array!(@locations) do |location|
  json.extract! location, :id, :name
  json.url location_url(location, format: :json)
  json.houses location.houses.order(:name) do |house|
		json.extract! house, :id, :name
		json.rooms house.rooms.order(:id) do |room|
			json.extract! room, :id, :name
			json.beds room.beds.order(:number) do |bed|
				json.extract! bed, :id, :number, :usable
			end
		end
	end
end