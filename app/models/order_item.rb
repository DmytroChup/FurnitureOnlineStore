class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price

  private

  def set_price
    if product.price.present? # пока так, потом нужно будет убрать
      self.price = product.price * quantity
    else
      self.price = 0
    end
  end
end
