require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "display_name should return category_name" do
    assert_equal @category.display_name, @category.category_name
  end

  test "ransackable_associations should return correct associations" do
    expected_associations = ["subcategories"]
    assert_equal expected_associations, Category.ransackable_associations
  end

  test "ransackable_attributes should return correct attributes" do
    expected_attributes = %w[category_name created_at id id_value updated_at]
    assert_equal expected_attributes, Category.ransackable_attributes
  end
end