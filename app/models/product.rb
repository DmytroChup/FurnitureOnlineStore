# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :producer, optional: true
  has_many :order_items
  has_many :orders, through: :order_items
  # has_many :carts
  
  def self.ransackable_attributes(auth_object = nil)
    ["availability", "color", "created_at", "height", "id", "id_value", "length", "material", "name", "price", "producer_id", "subcategory_id", "updated_at", "width"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "orders", "producer", "subcategory"]
  end
end
