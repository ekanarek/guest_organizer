class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :table, optional: true
  has_many :guest_dietary_restrictions
  has_many :dietary_restrictions, through: :guest_dietary_restrictions

  validates :user, presence: true
  validates :name, presence: true
  validate :table_not_full, if: -> { table_id_changed? && table.present? }

  scope :unassigned, -> { where(table_id: nil) }

  def table_not_full
    return unless table.seats_taken >= table.seat_capacity

    errors.add(:table, "is at full capacity")
  end
end
