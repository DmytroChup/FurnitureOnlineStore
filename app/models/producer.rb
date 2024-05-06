# frozen_string_literal: true

class Producer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :products

  validates :phone, presence: true, format: {with: /\A\d{10}\z/, message: "must be 10 digits"}
  # validates :producer_id, presence: true
  # validates :producer_name, presence: true
  # validates :country, presence: true
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :email_domain

  def self.ransackable_associations(_auth_object=nil)
    %w[messages private_chats_as_producer products]
  end

  def self.ransackable_attributes(_auth_object=nil)
    %w[confirmation_sent_at confirmation_token confirmed_at country created_at email
       encrypted_password id id_value phone producer_name remember_created_at reset_password_sent_at
       reset_password_token unconfirmed_email updated_at]
  end

  private

  def email_domain
    domain = email.split("@").last
    allowed_domains = ["karazin.ua"]
    errors.add(:email, "Invalid Domain") unless allowed_domains.include?(domain)
  end
end
