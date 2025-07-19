require 'rails_helper'

RSpec.describe Team, type: :model do
  it "est valide avec un nom et une ville" do
    team = Team.new(name: "Equipe", city: "Ville")
    expect(team).to be_valid
  end

  it "est invalide sans nom" do
    team = Team.new(city: "Ville")
    expect(team).not_to be_valid
  end

  it "est invalide si le nom dépasse 50 caractères" do
    team = Team.new(name: "A" * 51, city: "Ville")
    expect(team).not_to be_valid
  end

  it "est invalide sans ville" do
    team = Team.new(name: "Nom de l'équipe")
    expect(team).not_to be_valid
  end
end
