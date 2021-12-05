class Building < ApplicationRecord
  has_many :apartments
  belongs_to :user

  validates :name, :address, :city, presence: true
  validates :name, uniqueness: true
end
