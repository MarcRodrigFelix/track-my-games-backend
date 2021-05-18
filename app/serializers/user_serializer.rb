class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :games

  has_many :games
end
