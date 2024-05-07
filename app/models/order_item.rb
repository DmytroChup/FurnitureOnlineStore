# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at id id_value order_id price product_id quantity updated_at]
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[order product]
  end

  private

  def set_price
    self.price = if product.price.present? # пока так, потом нужно будет убрать
                   product.price * quantity
                 else
                   0
                 end
  end
end
