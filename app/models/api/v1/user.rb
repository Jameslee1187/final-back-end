class Api::V1::User < ApplicationRecord
  has_many :favorites
  has_many :teams, through: :favorites
end
