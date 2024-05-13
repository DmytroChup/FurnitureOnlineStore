# frozen_string_literal: true

class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  has_many :users_subcategories
  has_many :found_users, through: :users_subcategories

  def display_name
    subcategory_name
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[category products]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[category_id created_at id id_value subcategory_name updated_at]
  end
end
