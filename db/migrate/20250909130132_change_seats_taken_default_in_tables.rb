class ChangeSeatsTakenDefaultInTables < ActiveRecord::Migration[8.0]
  def change
    change_column_default :tables, :seats_taken, from: nil, to: 0
  end
end
