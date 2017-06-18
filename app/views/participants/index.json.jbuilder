json.array!(@participants) do |participant|
  json.extract! participant, :id, :guest_id, :participation_id
  json.url participant_url(participant, format: :json)
end
