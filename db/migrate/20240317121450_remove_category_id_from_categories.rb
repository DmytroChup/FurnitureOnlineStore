# frozen_string_literal: true

class RemoveCategoryIdFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :category_id, :integer
  end
end
