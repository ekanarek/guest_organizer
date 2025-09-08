class CreateGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age
      t.string :table_id

      t.timestamps
    end
  end
end
