# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :producer, optional: true
  has_many :order_items
  has_many :orders, through: :order_items
  # has_many :carts
end
