json.extract! cart, :id, :cart_id, :product_id, :quantity, :price, :created_at, :updated_at
json.url cart_url(cart, format: :json)
