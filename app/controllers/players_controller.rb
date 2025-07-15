class PlayersController < ApplicationController
    # affichage de la liste des équipes
    def index
        @players = Player.all
    end

    # affichage du formulaire de creation d'un joueur
    def new
        @roles = Role.all
        @teams = Team.all
        @player = Player.new
    end

    # creation d'un joueur
    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to @player, notice: 'Joueur créé avec succès.'
        else
            @roles = Role.all
            @teams = Team.all
            render :new
        end
    end

    # affichage d'une équipe
    def show
        @player = Player.find(params[:id])
    end

    # suppression d'une équipe
    def destroy
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to players_path, notice: 'Le joueur a bien été supprimé.'
    end

    private

    # n'autoriser que les parametres name et role_id (securite)
    def player_params
        params.require(:player).permit(:name, :role_id, :team_id)
    end
end
