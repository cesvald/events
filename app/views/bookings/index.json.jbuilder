json.array!(@bookings) do |booking|
  json.extract! booking, :id, :start_date, :end_date, :bed_id, :host_id, :bed_id
  json.url booking_url(booking, format: :json)
end
