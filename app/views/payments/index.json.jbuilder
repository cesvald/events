json.array!(@payments) do |payment|
  json.extract! payment, :id, :participant_id, :paid_at, :amount, :description
  json.url payment_url(payment, format: :json)
end
