class User < ApplicationRecord
  has_secure_password
  validates :username, :name , presence: true
  validates :username , uniqueness: true
end
