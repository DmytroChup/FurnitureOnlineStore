# frozen_string_literal: true

json.extract! product, :id, :subcategory_id, :name, :price, :height, :width, :length, :color, :material, :producer_id,
              :availability, :created_at, :updated_at
json.url product_url(product, format: :json)
