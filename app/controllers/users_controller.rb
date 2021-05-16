class UsersController < ApplicationController

  # def new
  #   @user = User.new
  # end

  def index
    @users = User.all
    if @users
      render json: { users: @users }
    else
      render json: { status: 500, errors: ['Oops, sorry. No users found.'] }
    end
  end

  def show
    @user = User.find( params[:id] )
    games = @user.games.all
    if @user
      render json: {
        user: @user,
        games: games,
        current_id: @user.id
      }
    else
      render json: { status: 500, errors: ['Oops, user not found. Try again.'] }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: { status: :created, user: @user, id: @user.id }
    else
      render json: { status: 500, error: @user.errors.full_messages }
    end
  end


  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end