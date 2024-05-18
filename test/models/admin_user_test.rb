# frozen_string_literal: true

require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def setup
    @admin_user = AdminUser.new(
      email:    "admin@example.com",
      password: "password123"
    )
  end

  test "valid admin user" do
    assert @admin_user.valid?
  end

  test "invalid without email" do
    @admin_user.email = nil
    refute @admin_user.valid?
    assert_not_nil @admin_user.errors[:email]
  end

  test "invalid without password" do
    @admin_user.password = nil
    refute @admin_user.valid?
    assert_not_nil @admin_user.errors[:password]
  end

  test "invalid with short password" do
    @admin_user.password = "short"
    refute @admin_user.valid?, "saved admin user with short password"
    assert_not_nil @admin_user.errors[:password]
  end
end
