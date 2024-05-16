# frozen_string_literal: true

class PaymentHistory < ApplicationRecord
  belongs_to :user
  has_many :orders

  # validates :payment_id, presence: true
  # validates :user_id, presence: true
  # validates :payment_method, presence: true
  # validates :payment_date, presence: true
  # validates :amount, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_attributes(_auth_object=nil)
    %w[amount created_at id id_value payment_date payment_method updated_at user_id]
  end
end
