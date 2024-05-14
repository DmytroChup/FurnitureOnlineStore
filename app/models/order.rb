class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_history
  has_many :order_items
end
