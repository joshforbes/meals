class User < ApplicationRecord
  has_one :token
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
