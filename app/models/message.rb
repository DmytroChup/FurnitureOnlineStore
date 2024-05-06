class Message < ApplicationRecord
  belongs_to :private_chat
  belongs_to :profile, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "private_chat_id", "profile_id", "profile_type", "updated_at"]
  end
end
