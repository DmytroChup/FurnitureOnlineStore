class Product < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :producer
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews
  # has_many :carts

  def average_rating
    reviews.average(:rating)
  end

  def review_count
    reviews.count
  end

end
