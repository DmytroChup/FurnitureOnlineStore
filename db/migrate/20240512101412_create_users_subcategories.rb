# frozen_string_literal: true

class CreateUsersSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :users_subcategories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps
    end
  end
end
