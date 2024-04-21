# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price

  private

  def set_price
    self.price = if product.price.present? # пока так, потом нужно будет убрать
                   product.price * quantity
                 else
                   0
                 end
  end
end
