# frozen_string_literal: true

class RemoveAmountFromPaymentHistories < ActiveRecord::Migration[7.1]
  def change
    remove_column :payment_histories, :amount, :float
  end
end
