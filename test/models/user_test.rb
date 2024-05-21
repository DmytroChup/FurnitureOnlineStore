# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      first_name: "Test",
      last_name: "User",
      username: "testuser",
      password: "password",
      email: "user@example.com"
    )
  end

  test "should be valid with valid attributes" do
    assert @user.valid?, @user.errors.full_messages.to_sentence
  end

  test "should be invalid without first_name" do
    @user.first_name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:first_name], "can't be blank"
  end

  test "should be invalid without last_name" do
    @user.last_name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:last_name], "can't be blank"
  end

  test "should be invalid without username" do
    @user.username = nil
    assert_not @user.valid?
    assert_includes @user.errors[:username], "can't be blank"
  end

  test "should be invalid without password" do
    @user.password = nil
    assert_not @user.valid?
    assert_includes @user.errors[:password], "can't be blank"
  end

  test "should be invalid with short password" do
    @user.password = "short"
    assert_not @user.valid?
    assert_includes @user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "should have many subcategories through users_subcategories" do
    association = User.reflect_on_association(:subcategories)
    assert_equal :has_many, association.macro
    assert_equal :users_subcategories, association.options[:through]
  end
end
