# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  def self.ransackable_attributes(_auth_object=nil)
    %w[comment created_at id id_value product_id rating updated_at user_id]
  end
end
