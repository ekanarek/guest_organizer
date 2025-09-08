class ChangeTableIdTypeInGuests < ActiveRecord::Migration[8.0]
  def change
    change_column :guests, :table_id, :integer
  end
end
