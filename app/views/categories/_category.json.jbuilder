# frozen_string_literal: true

json.extract! category, :id, :category_name, :created_at, :updated_at
json.url category_url(category, format: :json)
