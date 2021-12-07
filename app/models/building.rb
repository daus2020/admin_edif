class Building < ApplicationRecord
  has_many :apartments, dependent: :delete_all
  # has_many :apartments
  belongs_to :user

  validates :name, :address, :city, presence: true
  validates :name, uniqueness:  { scope: :city }
end
