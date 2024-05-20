require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  def setup
    @subcategory = subcategories(:one)
  end

  test "subcategory should be valid" do
    assert @subcategory.valid?
  end

  test "display_name should return subcategory_name" do
    assert_equal @subcategory.display_name, @subcategory.subcategory_name
  end

  test "ransackable_associations should return correct associations" do
    expected_associations = %w[category products]
    assert_equal expected_associations, Subcategory.ransackable_associations
  end

  test "ransackable_attributes should return correct attributes" do
    expected_attributes = %w[category_id created_at id id_value subcategory_name updated_at]
    assert_equal expected_attributes, Subcategory.ransackable_attributes
  end
end