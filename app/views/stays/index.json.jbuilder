json.array!(@stays) do |stay|
  json.extract! stay, :id, :participant_id, :space_id, :start_at, :end_at
  json.url stay_url(stay, format: :json)
end
