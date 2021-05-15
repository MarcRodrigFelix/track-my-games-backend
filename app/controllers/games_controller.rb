class GamesController < ApplicationController

    def index
        @games = Game.all
        if @games
            render json: { games: @games }
        else
            render json: { errors: ["oops, no games yet"] }
        end
    end

    def show
        @games = Game.find_by(user_id: @user_id)
    end

    def create
    end

end