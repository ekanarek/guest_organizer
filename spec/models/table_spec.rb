require 'rails_helper'

RSpec.describe Table, type: :model do 
  describe "factories" do 
    it "has a valid factory" do 
      expect(build(:table)).to be_valid 
    end
  end

  describe "associations" do 
    it { should belong_to(:user) }
    it { should have_many(:guests) }
  end

  describe "validations" do 
    subject { build(:table, user: create(:user)) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
