json.array!(@modalities) do |modality|
  json.extract! modality, :id, :name, :event_id
  json.url modality_url(modality, format: :json)
end
