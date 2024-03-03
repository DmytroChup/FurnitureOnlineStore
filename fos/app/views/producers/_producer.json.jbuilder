json.extract! producer, :id, :producer_id, :producer_name, :country, :email, :phone, :created_at, :updated_at
json.url producer_url(producer, format: :json)
