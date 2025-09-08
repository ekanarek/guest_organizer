class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :seat_capacity
      t.integer :seats_taken

      t.timestamps
    end
  end
end
