require 'csv'

class HomeController < ApplicationController
  def index
  end

  def populate
    Team.destroy_all
    Player.destroy_all

    # seeds de prenoms
    prenoms_csv_file_path = Rails.root.join('db', 'seeds', 'prenoms.csv')
    prenoms = CSV.read(prenoms_csv_file_path, headers: false).flatten
    # seeds de noms d'équipes
    equipes_csv_file_path = Rails.root.join('db', 'seeds', 'equipes.csv')
    equipes = CSV.read(equipes_csv_file_path, headers: false).flatten
    # seeds de noms de villes
    villes_csv_file_path = Rails.root.join('db', 'seeds', 'villes.csv')
    villes = CSV.read(villes_csv_file_path, headers: false).flatten

    # check que les csv sont suffisants
    if prenoms.size < 11*8 || equipes.size < 8 || villes.size < 8
      redirect_to root_path, alert: 'Pas assez de données dans les fichiers seeds CSV.'
      return
    end

    roles = Role.all # pour ne pas avoir à les récupérer à chaque fois
    
    8.times do |i|
      team_name = equipes.sample
      equipes.delete(team_name) 
      city = villes.sample
      villes.delete(city)
      team = Team.create(name: team_name, city: city)
      11.times do
        prenom = prenoms.sample
        prenoms.delete(prenom)
        role = roles.sample
        Player.create(name: prenom, role: role, team: team)
      end
    end
    redirect_to root_path, notice: '8 équipes avec 11 joueurs chacune ont été créées avec succès.'
  end

end
