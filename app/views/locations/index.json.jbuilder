json.array!(@locations) do |location|
  json.extract! location, :id, :name
  json.url location_url(location, format: :json)
  json.houses location.houses do |house|
		json.extract! house, :id, :name
		json.rooms house.rooms do |room|
			json.extract! room, :id, :name
			json.beds room.beds do |bed|
				json.extract! bed, :id, :number
			end
		end
	end
end