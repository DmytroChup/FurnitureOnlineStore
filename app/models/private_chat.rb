class PrivateChat < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :producer, class_name: "Producer"
  has_many :messages, dependent: :destroy

  def self.get_private_chat(user_id, producer_id)
    where(
      "(user_id = :user_id AND producer_id = :producer_id) OR
      (user_id = :producer_id AND producer_id = :user_id)",
      user_id: user_id, producer_id: producer_id,
      ).first
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "producer_id", "updated_at", "user_id"]
  end
end
