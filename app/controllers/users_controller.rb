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
        errors: ['Oops, user not found. Try again.']
      }
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      render json: {
        user: @user
      }
    else
      render json: {
        error: @user.errors.full_messages
      }
    end
  end

end