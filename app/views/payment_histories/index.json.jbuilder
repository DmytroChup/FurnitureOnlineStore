# frozen_string_literal: true

json.array! @payment_histories, partial: "payment_histories/payment_history", as: :payment_history
