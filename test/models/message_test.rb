# frozen_string_literal: true

require "test_helper"

class MessageTest < ActiveSupport::TestCase
  setup do
    @private_chat = private_chats(:one)
    @profile = users(:one)
  end

  test "should be valid with valid attributes" do
    message = Message.new(content: "Hello", private_chat: @private_chat,
                          profile_id: @profile.id, profile_type: "User")
    assert message.valid?, message.errors.full_messages.to_sentence
  end

  test "should belong to private chat" do
    association = Message.reflect_on_association(:private_chat)
    assert_equal :belongs_to, association.macro
  end

  test "should belong to profile" do
    association = Message.reflect_on_association(:profile)
    assert_equal :belongs_to, association.macro
  end
end
