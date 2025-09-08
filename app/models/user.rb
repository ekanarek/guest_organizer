class User < ApplicationRecord
  has_secure_password 
  validates :username, presence: true, uniqueness: true 

  has_many :guests, dependent: :destroy 
  has_many :tables, dependent: :destroy 
  has_many :dietary_restrictions, dependent: :destroy 
end
