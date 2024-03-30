json.extract! order, :id, :user_id, :payment_histories_id, :order_date, :order_address, :order_completion_date, :created_at, :updated_at
json.url order_url(order, format: :json)
