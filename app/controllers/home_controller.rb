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

  def tournament # Simulation de tournoi SANS PERSISTENCE EN BASE DE DONNÉES
    
    teams = Team.all.to_a
    results = {}
    teams.each do |team|
      results[team.id] = { team: team, points: 0, kills_for: 0, kills_against: 0 }
    end

    # chaque équipe rencontre chaque autre une seule fois avec combination(2)
    teams.combination(2).each do |team_a, team_b|
      kills_a = rand(0..5)
      kills_b = rand(0..5)

      if kills_a > kills_b
        results[team_a.id][:points] += 3
      elsif kills_a < kills_b
        results[team_b.id][:points] += 3
      else
        results[team_a.id][:points] += 1
        results[team_b.id][:points] += 1
      end

      # update des stats
      results[team_a.id][:kills_for] += kills_a
      results[team_a.id][:kills_against] += kills_b
      results[team_b.id][:kills_for] += kills_b
      results[team_b.id][:kills_against] += kills_a
    end

    # d'abord par points , et ensuite par kills
    @ranking = results.values.sort_by { |r| [-r[:points], -r[:kills_for]] }
  end
end
