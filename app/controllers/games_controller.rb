class GamesController < ApplicationController

    def index
        games = Game.all
        if games
            render json: { games: games }
        else
            render json: { errors: ["oops, no games yet"] }
        end
    end

    def show
        game = Game.find(params[:id])
        if game
            render json: { game: game }
        end
    end

end