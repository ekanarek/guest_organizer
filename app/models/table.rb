class Table < ApplicationRecord
  belongs_to :user
  has_many :guests

  validates :name, presence: true, uniqueness: true
end
