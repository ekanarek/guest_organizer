require 'rails_helper' 

RSpec.describe Guest, type: :model do 
  describe "factories" do 
    it "has a valid factory" do 
      expect(build(:guest)).to be_valid
    end
  end

  describe "associations" do 
    it { should belong_to(:user) }
    it { should belong_to(:table).optional }
    it { should have_many(:guest_dietary_restrictions) } 
    it { should have_many(:dietary_restrictions).through(:guest_dietary_restrictions) }
  end

  describe "validations" do 
    it { should validate_presence_of(:user) } 
    it { should validate_presence_of(:name) }
  end

  describe "custom validations" do 
    it "does not allow assignment to a full table" do 
      table = create(:table, seat_capacity: 2, seats_taken: 2)
      guest = build(:guest, table: table) 
      expect(guest).not_to be_valid 
      expect(guest.errors[:table]).to include("is at full capacity")
    end
  end

  describe "scopes" do 
    it "returns unassigned guests" do 
      assigned_guest = create(:guest, :with_table)
      unassigned_guest = create(:guest, table: nil)

      expect(Guest.unassigned).to include(unassigned_guest)
      expect(Guest.unassigned).not_to include(assigned_guest)
    end
  end
end
