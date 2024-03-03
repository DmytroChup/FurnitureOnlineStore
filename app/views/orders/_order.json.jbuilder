json.extract! order, :id, :order_id, :user_id, :payment_id, :order_date, :order_address, :created_at, :updated_at
json.url order_url(order, format: :json)
