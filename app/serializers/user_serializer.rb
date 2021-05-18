class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :games
end
