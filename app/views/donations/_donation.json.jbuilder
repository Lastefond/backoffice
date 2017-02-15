json.extract! donation, :id, :donator_id, :amount, :created_at, :updated_at
json.url donation_url(donation, format: :json)