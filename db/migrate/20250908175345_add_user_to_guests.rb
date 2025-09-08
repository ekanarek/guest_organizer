class AddUserToGuests < ActiveRecord::Migration[8.0]
  def change
    add_reference :guests, :user, null: false, foreign_key: true
  end
end
