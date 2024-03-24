class PaymentHistory < ApplicationRecord
  belongs_to :user
  has_many :orders

  # validates :payment_id, presence: true
  # validates :user_id, presence: true
  # validates :payment_method, presence: true
  # validates :payment_date, presence: true
  # validates :amount, presence: true, numericality: { greater_than: 0 }
end
