# frozen_string_literal: true

class RemoveCartIdFromCarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :carts, :cart_id, :integer
  end
end
