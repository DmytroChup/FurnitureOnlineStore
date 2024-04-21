# frozen_string_literal: true

class AddTotalToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :total, :float
  end
end
