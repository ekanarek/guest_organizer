class DietaryRestriction < ApplicationRecord
  belongs_to :user, optional: true

  has_many :guest_dietary_restrictions
  has_many :guests, through: :guest_dietary_restrictions
end
