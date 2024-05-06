# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.integer :category_id
      t.string :category_name

      t.timestamps
    end
  end
end
