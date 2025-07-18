class TeamsController < ApplicationController
    # affichage de la liste des équipes
    def index
        @teams = Team.all
    end

    # affichage du formulaire de creation d'une equipe
    def new
        @team = Team.new
    end

    # creation d'une equipe
    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to @team, notice: "Joueur créé avec succès."
        else
            render :new
        end
    end

    # affichage d'une équipe (redirection automatique vers la page d'édition)
    def show
        @team = Team.find(params[:id])
        redirect_to edit_team_path(@team)
    end

    # suppression d'une équipe
    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        redirect_to teams_path, notice: "L'équipe a bien été supprimée."
    end

    # affichage du formulaire d'edition
    def edit
        @team = Team.find(params[:id])
    end

    # mise à jour
    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to @team, notice: "Équipe mise à jour avec succès."
        else
            render :edit
        end
    end

    private

    # n'autoriser que les parametres name et city pour une team (securite)
    def team_params
        params.require(:team).permit(:name, :city)
    end
end
