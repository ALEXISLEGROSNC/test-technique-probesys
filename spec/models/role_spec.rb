require 'rails_helper'

RSpec.describe Role, type: :model do
  it "est valide avec un nom valide" do
    role = Role.new(name: "Tank")
    expect(role).to be_valid
  end

  it "est invalide sans nom" do
    role = Role.new(name: nil)
    expect(role).not_to be_valid
    expect(role.errors[:name]).to include("can't be blank")
  end

  it "est invalide avec un nom de plus de 50 caractères" do
    role = Role.new(name: "A" * 51)
    expect(role).not_to be_valid
    expect(role.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it "est invalide avec un nom non unique" do
    Role.create(name: "Heal")
    role = Role.new(name: "Heal")
    expect(role).not_to be_valid
    expect(role.errors[:name]).to include("has already been taken")
  end

  it "est invalide avec un nom contenant des caractères non autorisés" do
    role = Role.new(name: "Tank@")
    expect(role).not_to be_valid
    expect(role.errors[:name]).to include("ne peut contenir que des lettres, chiffres et espaces")
  end
end
