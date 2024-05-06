# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "order_id", "price", "product_id", "quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order", "product"]
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
