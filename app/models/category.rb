# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories

  def display_name
    category_name
  end

  def self.ransackable_associations(_auth_object=nil)
    ["subcategories"]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[category_name created_at id id_value updated_at]
  end
end
