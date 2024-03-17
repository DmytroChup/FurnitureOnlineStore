json.extract! payment_history, :id, :user_id, :payment_method, :payment_date, :amount, :created_at, :updated_at
json.url payment_history_url(payment_history, format: :json)
