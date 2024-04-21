class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_history
  has_many :order_items
  has_many :products, through: :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "order_address", "order_date", "payment_histories_id", "updated_at", "user_id"]
  end
end
