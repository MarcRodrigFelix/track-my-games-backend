class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def encode_token
    JWT.encode({ user_id: user_id}, ENV['JWT'])
  end

end
