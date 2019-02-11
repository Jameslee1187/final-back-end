class Api::V1::FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :team
end
