class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: {
                user: @user
            }
        else
            render json: {
                status: 500,
                errors: ['sorry, user not found']
            }
        end
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

end