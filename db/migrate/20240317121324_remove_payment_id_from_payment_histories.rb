# frozen_string_literal: true

class RemovePaymentIdFromPaymentHistories < ActiveRecord::Migration[7.1]
  def change
    remove_column :payment_histories, :payment_id, :integer
  end
end
