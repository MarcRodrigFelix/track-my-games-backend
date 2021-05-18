class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :platform, :kind, :is_completed, :user_id, :

  belongs_to :user
end
