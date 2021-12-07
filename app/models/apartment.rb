class Apartment < ApplicationRecord
  belongs_to :building

  validates :number, presence: true, uniqueness: { scope: :building }, length: { in: 1..5 }
  validates :status, inclusion: { in: ['Disponible', 'Reservado','Arrendado'] }

  STATUS_OPTIONS = ['Disponible', 'Reservado','Arrendado']
end
