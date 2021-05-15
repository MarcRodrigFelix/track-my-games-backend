class SessionController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    
    if @user && @user.authenticate(session_params[:password])
      login
      render json: { logged_in: true, user: @user }
    else
      render json: { status: 401, errors: ['no such user', 'double check your login info or sign up!'] }
    end
  end



end
