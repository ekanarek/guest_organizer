class AddGlobalDietaryRestrictions < ActiveRecord::Migration[8.0]
  def up 
    restrictions = [
      { name: "Vegetarian", description: "No meat, poultry, or fish" },
      { name: "Vegan", description: "No animal products at all" },
      { name: "Gluten-Free", description: "No wheat, barley, rye, or oats" },
      { name: "Nut Allergy", description: "Must avoid all nuts" },
      { name: "Dairy-Free", description: "No milk, cheese, or dairy products" }, 
      { name: "Halal", description: "Must have a separate meal following Halal conventions" }, 
      { name: "Kosher", description: "Must have a separate meal following Kosher conventions" }
    ]

    restrictions.each do |r| 
      DietaryRestriction.find_or_create_by!(name: r[:name], user_id: nil) do |dr| 
        dr.description = r[:description] 
      end 
    end
  end

  def down 
    DietaryRestriction.where(name: [ 
      "Vegetarian", "Vegan", "Gluten-Free", "Nut Allergy", "Dairy-Free", "Halal", "Kosher"
    ]).destroy_all 
  end
end
