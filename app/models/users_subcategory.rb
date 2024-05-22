# frozen_string_literal: true

class UsersSubcategory < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at id id_value subcategory_id updated_at user_id]
  end
end
