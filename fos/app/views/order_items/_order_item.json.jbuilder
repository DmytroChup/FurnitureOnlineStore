json.extract! order_item, :id, :order_item_id, :product_id, :order_id, :quantity, :price, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
