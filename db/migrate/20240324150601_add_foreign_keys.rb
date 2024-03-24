class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_column :subcategories, :category_id, :integer
    remove_column :products, :subcategory_id, :integer
    remove_column :products, :producer, :integer
    remove_column :order_items, :product_id, :integer
    remove_column :order_items, :order_id, :integer
    remove_column :orders, :user_id, :integer
    remove_column :orders, :payment_id, :integer
    remove_column :payment_histories, :user_id, :integer

    add_reference :subcategories, :category, foreign_key: true
    add_reference :products, :subcategory, foreign_key: true
    add_reference :products, :producer, foreign_key: true
    add_reference :order_items, :product, foreign_key: true
    add_reference :order_items, :order, foreign_key: true
    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :payment_histories, foreign_key: true
    add_reference :payment_histories, :user, foreign_key: true
  end
end
