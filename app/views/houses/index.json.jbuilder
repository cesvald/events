json.array!(@houses) do |house|
  json.extract! house, :id, :name, :location_id
  json.url house_url(house, format: :json)
end
