class GamesController < ApplicationController

    def index
        games = Game.all
        if games
            render json: games
        end
    end

    def show
        game = Game.find(params[:id])
        if game
            render json: game
        end
    end

    # def create
    #     game = Game.new(game_params)
    #     if game.save
    #         render json: game
    #     end
    # end

    def create
       game = logged_in_user.games.create(game_params)
    end


    private

    def game_params
        params.permit(:title, :platform, :kind)
    end

end