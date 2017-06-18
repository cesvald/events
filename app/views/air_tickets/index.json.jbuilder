json.array!(@air_tickets) do |air_ticket|
  json.extract! air_ticket, :id, :participant_id, :arrive_at, :arrive_to, :leave_at, :leave_from, :estimated_at
  json.url air_ticket_url(air_ticket, format: :json)
end
