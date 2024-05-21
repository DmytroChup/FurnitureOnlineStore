# frozen_string_literal: true

require "test_helper"

class PrivateChatTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @producer = producers(:one)
  end

  test "should be valid with valid attributes" do
    chat = PrivateChat.new(user: @user, producer: @producer)
    assert chat.valid?, chat.errors.full_messages.to_sentence
  end

  test "should belong to user" do
    association = PrivateChat.reflect_on_association(:user)
    assert_equal :belongs_to, association.macro
  end

  test "should belong to producer" do
    association = PrivateChat.reflect_on_association(:producer)
    assert_equal :belongs_to, association.macro
  end

  test "should have many messages" do
    association = PrivateChat.reflect_on_association(:messages)
    assert_equal :has_many, association.macro
  end

  test "should get private chat" do
    chat = PrivateChat.create(user: @user, producer: @producer)
    found_chat = PrivateChat.get_private_chat(@user.id, @producer.id)
    assert_not_nil found_chat
    assert_equal chat.id, found_chat.id
  end

  test "should return ransackable attributes" do
    attributes = PrivateChat.ransackable_attributes
    assert_includes attributes, "created_at"
    assert_includes attributes, "id"
    assert_includes attributes, "producer_id"
    assert_includes attributes, "updated_at"
    assert_includes attributes, "user_id"
  end
end
