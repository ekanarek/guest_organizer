class MakeUserIdNullableInDietaryRestrictions < ActiveRecord::Migration[8.0]
  def change
    change_column_null :dietary_restrictions, :user_id, true 
  end
end
