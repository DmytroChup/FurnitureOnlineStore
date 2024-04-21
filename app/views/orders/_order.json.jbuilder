# frozen_string_literal: true

json.extract! order, :id, :user_id, :payment_history_id, :order_date, :order_address, :created_at, :updated_at
json.url order_url(order, format: :json)
