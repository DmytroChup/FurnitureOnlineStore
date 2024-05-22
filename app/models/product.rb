# frozen_string_literal: true

require "csv"

class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :producer, optional: true
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :product_image, dependent: :destroy
  has_many :reviews
  # has_many :carts

  validate :acceptable_image
  before_destroy :purge_image

  def acceptable_image
    return unless product_image.attached?

    errors.add(:product_image, "is too big") unless product_image.blob.byte_size <= 3.megabyte

    acceptable_types = ["image/jpeg", "image/png"]
    return if acceptable_types.include?(product_image.content_type)

    errors.add(:product_image, "must be a JPEG or PNG")
  end

  def purge_image
    product_image.purge_later if product_image.attached?
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[availability color created_at height id id_value length material name price
       producer_id subcategory_id updated_at width image_attached]
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[order_items orders producer product_image_attachment product_image_blob reviews subcategory]
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

  def average_rating
    reviews.average(:rating)
  end

  def review_count
    reviews.count
  end
end
