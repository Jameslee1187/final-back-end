class Api::V1::User < ApplicationRecord
  has_many :favorites
  has_many :teams, through: :favorites
  has_secure_password
end
