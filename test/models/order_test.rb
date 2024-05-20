# frozen_string_literal: true

require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test "order should be valid" do
    assert @order.valid?
  end

  test "ransackable_attributes should return correct attributes" do
    expected_attributes = %w[created_at id id_value order_address order_date payment_history_id updated_at user_id
                             total]
    assert_equal expected_attributes, Order.ransackable_attributes
  end

  test "ransackable_associations should return correct associations" do
    expected_associations = %w[order_items payment_history products user]
    assert_equal expected_associations, Order.ransackable_associations
  end
end
