json.array!(@spaces) do |space|
  json.extract! space, :id, :event_id, :place_id, :amount
  json.url space_url(space, format: :json)
end
