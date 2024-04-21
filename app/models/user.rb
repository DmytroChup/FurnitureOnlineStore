class User < ApplicationRecord
  # has_many :carts
  has_many :orders
  has_many :payment_histories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def self.ransackable_associations(auth_object = nil)
    ["messages", "orders", "payment_histories", "private_chats_as_user"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "password", "patronymic", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at", "username"]
  end
end
