class GuestDietaryRestriction < ApplicationRecord
  belongs_to :guest
  belongs_to :dietary_restriction
end
