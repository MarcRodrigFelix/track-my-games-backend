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
    if @user
      render json: {
        user: @user
      }
    else
      render json: { status: 500, errors: ['Oops, user not found. Try again.'] }
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      render json: { user: @user }
    else
      render json: { error: @user.errors.full_messages }
    end
  end


  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end