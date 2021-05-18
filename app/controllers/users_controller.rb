class UsersController < ApplicationController

  def new
    @user = User.new
  end

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
      render json: { user: UserSerializer.new(@user).as_json }
    else
      render json: { status: 500, errors: ['Oops, user not found. Try again.'] }
    end
    
  end

  def create
    user = User.create(user_params)
    token = encode_token(user.id)
    render json: { user: UserSerializer.new(user), token: token }
  end


  private
  
    def user_params
      params.permit(:username, :password)
    end

end