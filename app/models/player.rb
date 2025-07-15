class Player < ApplicationRecord
  # a une equipe (optionnelle)
  belongs_to :team, optional: true
  # a un role
  belongs_to :role
  # nom obligatoire, unique, max 50 caracteres, lettres, chiffres et espaces
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "ne peut contenir que des lettres, chiffres et espaces" }
  # ne peux pas avoir plus de 11 joueurs
  validate :team_player_limit
  
  private
  
  def team_player_limit
    if team && team.players.count >= 11
      errors.add(:team, "ne peut pas avoir plus de 11 joueurs")
    end
  end

end
