require 'rails_helper'

RSpec.describe Player, type: :model do
  
  let(:team) { Team.create(name: "Nom de l'équipe", city: "Ville") }
  let(:role) { Role.create(name: "Tank") }

  it "est valide avec un nom et un rôle" do
    player = Player.new(name: "Nom du joueur", role: role, team: team)
    expect(player).to be_valid
  end

  it "est invalide sans nom" do
    player = Player.new(role: role, team: team)
    expect(player).not_to be_valid
  end

  it "est invalide sans rôle" do
    player = Player.new(name: "Nom du joueur", team: team)
    expect(player).not_to be_valid
  end

  it "est valide avec un rôle existant" do
    player = Player.new(name: "Nom du joueur", role: role, team: team)
    expect(player).to be_valid
  end
end
