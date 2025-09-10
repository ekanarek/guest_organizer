class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :table, optional: true
  has_many :guest_dietary_restrictions
  has_many :dietary_restrictions, through: :guest_dietary_restrictions

  validates :user, presence: true
  validates :name, presence: true

  scope :unassigned, -> { where(table_id: nil) }
end
