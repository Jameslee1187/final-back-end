class Api::V1::Favorite < ApplicationRecord
  belongs_to :team
  belongs_to :user
end
