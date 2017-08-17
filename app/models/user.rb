class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  has_many :recipes

  def token
    Token.new(self)
  end
end
