require 'rails_helper' 

RSpec.describe DietaryRestriction, type: :model do 
  describe "factories" do 
    it "has a valid factory" do 
      expect(build(:dietary_restriction)).to be_valid 
    end
  end

  describe "associations" do 
    it { should belong_to(:user).optional }
    it { should have_many(:guest_dietary_restrictions) }
    it { should have_many(:guests).through(:guest_dietary_restrictions) }
  end

  describe "validations" do 
    it { should validate_presence_of(:name) }
  end
end
