class Api::V1::StadiumsController < ApplicationController
    def index
        stadiums = Stadium.all
        render json: stadiums, include: [:teams]
    end

    def show
        @stadium = Stadium.find(params[:id])
        render json: @stadium
    end

    def create
        @stadium = Stadium.new(stadium_params)
        
        if @stadium.save
            render json: @stadium, include: [:teams], status: :created
        else
            render json: {error: 'Error Creating Stadium'}
        end
    end

    def update
        if @stadium.update(stadium_params)
            render json: StadiumSerializer.new(@stadium)
        else
            render json: {error: 'Error Updating Stadium'}
        end
    end

    def destroy
         @stadium = Stadium.find(params[:id])
         @stadium.destroy
    end

    private

    def stadium_params
        params.require(:stadium).permit(:name, :team)
    end
end