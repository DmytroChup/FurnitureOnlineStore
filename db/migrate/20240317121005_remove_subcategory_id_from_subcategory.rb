# frozen_string_literal: true

class RemoveSubcategoryIdFromSubcategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :subcategories, :subcategory_id, :integer
  end
end
