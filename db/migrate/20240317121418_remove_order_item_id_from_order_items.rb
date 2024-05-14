# frozen_string_literal: true

class RemoveOrderItemIdFromOrderItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_items, :order_item_id, :integer
  end
end
