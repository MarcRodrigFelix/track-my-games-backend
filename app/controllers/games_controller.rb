class GamesController < ApplicationController

    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.find(params[:id])
        if game
            render json: game
        end
    end

    def create
        game = Game.new(game_params)
        if game.save
            render json: game
        end
    end


    private

    def game_params
        params.require(:pokemon).permit(:title, :platform, :kind, :is_completed)
    end

end