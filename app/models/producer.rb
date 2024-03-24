class Producer < ApplicationRecord
  has_many :products
  # validates :producer_id, presence: true
  # validates :producer_name, presence: true
  # validates :country, presence: true
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
end
