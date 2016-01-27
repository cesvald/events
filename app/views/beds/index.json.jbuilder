json.array!(@beds) do |bed|
  json.extract! bed, :id, :number, :room_id
  json.url bed_url(bed, format: :json)
end
