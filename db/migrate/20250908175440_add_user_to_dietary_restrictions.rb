class AddUserToDietaryRestrictions < ActiveRecord::Migration[8.0]
  def change
    add_reference :dietary_restrictions, :user, null: false, foreign_key: true
  end
end
