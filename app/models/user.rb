class User < ApplicationRecord
  has_many :sessions, foreign_key: 'user_id', dependent: :destroy
  has_secure_password

  validates :username, presence: true
end
