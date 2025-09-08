class CreateGuestDietaryRestrictions < ActiveRecord::Migration[8.0]
  def change
    create_table :guest_dietary_restrictions do |t|
      t.integer :guest_id
      t.integer :dietary_restriction_id

      t.timestamps
    end
  end
end
