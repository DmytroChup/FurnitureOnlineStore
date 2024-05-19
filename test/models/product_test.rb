require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:one)
  end

  test "product should be valid" do
    assert @product.valid?
  end

  test "ransackable_attributes should return correct attributes" do
    expected_attributes = %w[availability color created_at height id id_value length material name price
       producer_id subcategory_id updated_at width]
    assert_equal expected_attributes, Product.ransackable_attributes
  end

  test "ransackable_associations should return correct associations" do
    expected_associations = %w[order_items orders producer subcategory]
    assert_equal expected_associations, Product.ransackable_associations
  end

  test "to_csv should return csv string" do
    csv = Product.to_csv
    assert csv.is_a?(String)
    assert csv.lines.first.chomp.split(',').include?('name')
  end

  test "average_rating should return average rating of product reviews" do
    assert_equal @product.average_rating, @product.reviews.average(:rating)
  end

  test "review_count should return count of product reviews" do
    assert_equal @product.review_count, @product.reviews.count
  end
end