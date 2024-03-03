class CreatePaymentHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_histories do |t|
      t.integer :payment_id
      t.integer :user_id
      t.string :payment_method
      t.datetime :payment_date
      t.float :amount

      t.timestamps
    end
  end
end
