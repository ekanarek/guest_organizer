class AddUserToTables < ActiveRecord::Migration[8.0]
  def change
    add_reference :tables, :user, null: false, foreign_key: true
  end
end
