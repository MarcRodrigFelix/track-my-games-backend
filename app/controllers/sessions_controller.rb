class SessionsController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token(user.id)
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { errors: 'Sorry, try password or username again'}
    end
  end

  def autologin
    render json: {user: UserSerializer.new(logged_in_user)}
  end

end
