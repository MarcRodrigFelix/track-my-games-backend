class ApplicationController < ActionController::API

    def login
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

end
