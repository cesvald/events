json.array!(@modalities) do |modality|
  json.extract! modality, :id, :name, :event_id
  json.url event_modality_url(modality.event, modality, format: :json)
  json.spaces modality.spaces do |space|
		json.extract! space, :id, :amount
		json.name space.place.name
	end
end
