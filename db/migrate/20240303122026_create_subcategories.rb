# frozen_string_literal: true

class CreateSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :subcategories do |t|
      t.integer :subcategory_id
      t.string :subcategory_name
      t.integer :category_id

      t.timestamps
    end
  end
end
