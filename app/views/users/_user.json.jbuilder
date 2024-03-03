json.extract! user, :id, :user_id, :user_role, :first_name, :patronymic, :last_name, :phone, :username, :password, :cart_id, :created_at, :updated_at
json.url user_url(user, format: :json)
