# frozen_string_literal: true

require "test_helper"

class UsersSubcategoryTest < ActiveSupport::TestCase
  setup do
    @user = User.create(
      first_name: "Test",
      last_name:  "User",
      username:   "testuser",
      password:   "password"
    )

    @subcategory = Subcategory.create(subcategory_name: "Test Subcategory")

    @users_subcategory = UsersSubcategory.new(
      user:        @user,
      subcategory: @subcategory
    )
  end

  test "should be valid with valid attributes" do
    assert @users_subcategory.valid?, @users_subcategory.errors.full_messages.to_sentence
  end

  test "should be invalid without user" do
    @users_subcategory.user = nil
    assert_not @users_subcategory.valid?
    assert_includes @users_subcategory.errors[:user], "must exist"
  end

  test "should be invalid without subcategory" do
    @users_subcategory.subcategory = nil
    assert_not @users_subcategory.valid?
    assert_includes @users_subcategory.errors[:subcategory], "must exist"
  end

  test "should belong to user" do
    association = UsersSubcategory.reflect_on_association(:user)
    assert_equal :belongs_to, association.macro
  end

  test "should belong to subcategory" do
    association = UsersSubcategory.reflect_on_association(:subcategory)
    assert_equal :belongs_to, association.macro
  end
end
