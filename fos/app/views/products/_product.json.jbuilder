json.extract! product, :id, :product_id, :subcategory_id, :name, :price, :height, :width, :length, :color, :material, :producer, :availability, :created_at, :updated_at
json.url product_url(product, format: :json)
