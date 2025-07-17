class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :edit, :update, :destroy]
    before_action :load_roles_and_teams, only: [:show, :edit, :new, :create]

    # affichage de la liste des équipes
    def index
        @players = Player.all
    end

    # affichage du formulaire de creation d'un joueur
    def new
        @player = Player.new
    end

    # creation d'un joueur
    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to @player, notice: 'Joueur créé avec succès.'
        else
            render :new
        end
    end

    # affichage d'un joueur (redirection automatique vers la page d'édition)
    def show
        render :edit
    end


    # affichage du formulaire d'edition
    def edit
    end

    # mise à jour
    def update
        if @player.update(player_params)
            redirect_to @player, notice: 'Joueur mis à jour avec succès.'
        else
            redirect_to edit_player_path(@player), alert: 'Erreur lors de la mise à jour du joueur.'
        end
    end
    
    # suppression d'un joueur'
    def destroy
        @player.destroy
        redirect_to players_path, notice: 'Le joueur a bien été supprimé.'
    end

    private

    # before action
    def set_player
        @player = Player.find(params[:id])
    end
    
    # before action
    def load_roles_and_teams
        @roles = Role.all
        @teams = Team.all
    end

    # n'autoriser que les parametres name et role_id (securite)
    def player_params
        params.require(:player).permit(:name, :role_id, :team_id)
    end
end
