class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.integer :subcategory_id
      t.string :name
      t.float :price
      t.float :height
      t.float :width
      t.float :length
      t.string :color
      t.string :material
      t.string :producer
      t.string :availability

      t.timestamps
    end
  end
end
