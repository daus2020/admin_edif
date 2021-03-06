class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buildings
  # has_many :apartments

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
