class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

  # track current user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # check if user is logged in with session user id
  def login!
    session[:user_id] = @user.id
  end

  # verify current user
  def logged_in?
    !!current_user
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end

end
