require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def setup
    @order_item = order_items(:one)
  end

  test "order item should be valid" do
    assert @order_item.valid?
  end

  test "ransackable_attributes should return correct attributes" do
    expected_attributes = %w[created_at id id_value order_id price product_id quantity updated_at]
    assert_equal expected_attributes, OrderItem.ransackable_attributes
  end

  test "ransackable_associations should return correct associations" do
    expected_associations = %w[order product]
    assert_equal expected_associations, OrderItem.ransackable_associations
  end
end