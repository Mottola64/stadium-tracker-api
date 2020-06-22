class Api::V1::TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams
    end

    def show
        @team =Team.find(params[:id])
        render json: @team
    end

    def create
        @team = Team.new(team_params)
        
        if @team.save
            render json: @team
        else
            render json: {error: 'Error Creating Team'}
        end
    end

    def update
        if @team.update(team_params)
            render json: TeamSerializer.new(@team)
        else
            render json: {error: 'Error Updating Team'}
        end
    end

    def destroy
         @team = Team.find(params[:id])
         @team.destroy
    end

    private

    def team_params
        params.require(@team).permit(:teamname)
    end
end