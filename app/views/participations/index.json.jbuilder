json.array!(@participations) do |participation|
  json.extract! participation, :id, :space_id, :modality_id, :amount
  json.url participation_url(participation, format: :json)
end
