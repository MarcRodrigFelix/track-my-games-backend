class ApplicationController < ActionController::API

  def encode_token(user_id)
    JWT.encode({ user_id: user_id}, ENV['JWT_KEY'])
  end

  def get_token
    request.headers['Authorization']
  end

  def decode_token
    JWT.decode(get_token, ENV['JWT_KEY'])[0]['user_id']
  end

  def logged_in_user
    User.find_by(id: decode_token)
  end

end
