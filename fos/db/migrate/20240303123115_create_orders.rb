class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :payment_id
      t.datetime :order_date
      t.string :order_address

      t.timestamps
    end
  end
end
