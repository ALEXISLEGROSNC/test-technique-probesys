class Player < ApplicationRecord
  belongs_to :role
  # nom obligatoire, unique, max 50 caracteres, lettres, chiffres et espaces
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "ne peut contenir que des lettres, chiffres et espaces" }
end
