class ApplicationController < ActionController::API
  helper_method :login, :logged_in?, :current_user, :authorized_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def login
    session[:user_id] = user.id
  end

  def logged_in?
    !!current_user
  end

  def authorized_user
    @user == current_user
  end

end
