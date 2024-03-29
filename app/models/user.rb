class User < ApplicationRecord
  # has_many :carts
  has_many :orders
  has_many :payment_histories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
