# frozen_string_literal: true

json.extract! user, :id, :first_name, :patronymic, :last_name, :phone, :username, :password, :cart_id,
              :created_at, :updated_at, :preferred_currency
json.url user_url(user, format: :json)
