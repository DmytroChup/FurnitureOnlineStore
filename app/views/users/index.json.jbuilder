# frozen_string_literal: true

json.array! @found_users, partial: "users/user", as: :user
