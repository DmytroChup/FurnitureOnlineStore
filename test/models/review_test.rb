require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @product = products(:one)
    @review = Review.new(comment: "Comment", rating: 5, user_id: @user.id, product_id: @product.id)
  end

  test "review should be valid" do
    assert @review.valid?
  end

  test "rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "rating should not be less than 0" do
    @review.rating = -1
    assert_not @review.valid?
  end

  test "rating should not be greater than 5" do
    @review.rating = 6
    assert_not @review.valid?
  end

  test "user_id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "product_id should be present" do
    @review.product_id = nil
    assert_not @review.valid?
  end
end