class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_history, optional: true
  has_many :order_items
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items

end
