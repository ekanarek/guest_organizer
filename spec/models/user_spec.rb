require 'rails_helper'

RSpec.describe User, type: :model do 
  describe "factories" do 
    it "has a valid factory" do 
      expect(build(:user)).to be_valid
    end
  end

  describe "associations" do 
    it { should have_many(:guests).dependent(:destroy) }
    it { should have_many(:tables).dependent(:destroy) }
    it { should have_many(:dietary_restrictions).dependent(:destroy) }
  end

  describe "validations" do 
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
end
