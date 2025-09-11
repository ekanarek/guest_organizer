require 'rails_helper' 

RSpec.describe GuestDietaryRestriction, type: :model do 
  describe "factories" do 
    it "has a valid factory" do 
      expect(build(:guest_dietary_restriction)).to be_valid
    end
  end

  describe "associations" do 
    it { should belong_to(:guest) }
    it { should belong_to(:dietary_restriction) }
  end
end
