class CreateDietaryRestrictions < ActiveRecord::Migration[8.0]
  def change
    create_table :dietary_restrictions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
