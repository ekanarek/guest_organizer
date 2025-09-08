class Guest < ApplicationRecord
  belongs_to :user 
  belongs_to :table 
  has_many :guest_dietary_restrictions 
  has_many :dietary_restrictions, through: :guest_dietary_restrictions 

  validates :user, presence: true 
end
