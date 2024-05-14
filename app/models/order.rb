# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_history, optional: true
  has_many :order_items
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at id id_value order_address order_date payment_history_id updated_at user_id total]
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[order_items payment_history products user]
  end
end
