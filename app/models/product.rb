# frozen_string_literal: true

require "csv"

class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :producer, optional: true
  has_many :order_items
  has_many :orders, through: :order_items
  # has_many :carts

  def self.ransackable_attributes(_auth_object=nil)
    %w[availability color created_at height id id_value length material name price
       producer_id subcategory_id updated_at width]
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[order_items orders producer subcategory]
  end

  def self.to_csv
    attributes = %w[name price height width length color material availability]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |product|
        csv << attributes.map {|attr| product.send(attr) }
      end
    end
  end
end
