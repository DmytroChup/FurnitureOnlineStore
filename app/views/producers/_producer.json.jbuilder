# frozen_string_literal: true

json.extract! producer, :id, :producer_name, :country, :email, :phone, :created_at, :updated_at
json.url producer_url(producer, format: :json)
