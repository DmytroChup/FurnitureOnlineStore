class Producer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :products

  has_many :messages, as: :profile
  has_many :private_chats_as_producer, class_name: "PrivateChat", foreign_key: :producer_id

  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  # validates :producer_id, presence: true
  # validates :producer_name, presence: true
  # validates :country, presence: true
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :email_domain

  def self.ransackable_associations(auth_object = nil)
    ["messages", "private_chats_as_producer", "products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "country", "created_at", "email", "encrypted_password", "id", "id_value", "phone", "producer_name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at"]
  end

  private

  def email_domain
    domain = email.split('@').last
    allowed_domains = ['karazin.ua']
    errors.add(:email, 'Invalid Domain') unless allowed_domains.include?(domain)
  end
end
