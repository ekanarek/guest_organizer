require 'rails_helper'

RSpec.describe "Guests", type: :request do 
  let(:user) { create(:user) }
  let!(:table) { create(:table, user: user) }
  before { log_in(user) }

  describe "POST /guests" do 
    it "creates an unassigned guest" do 
      expect {
        post "/guests", params: { guest: attributes_for(:guest, user: user, table_id: nil) }
      }.to change(user.guests, :count).by(1)
      
      expect(response).to redirect_to(root_path)
      follow_redirect! 
      expect(flash[:notice]).to eq("Guest added!")
    end

    it "creates a guest assigned to a table and increments seats_taken" do 
      expect {
        post "/tables/#{table.id}/guests", params: { guest: attributes_for(:guest, user: user, table_id: table.id) }
      }.to change(table.guests, :count).by(1)

      expect(table.reload.seats_taken).to eq(1)
      expect(response).to redirect_to("/tables/#{table.id}/guests")
      follow_redirect! 
      expect(flash[:notice]).to eq("Guest added!")
    end

    it "renders new on invalid params" do 
      post "/guests", params: { guest: { name: "", age: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq("Error creating guest")
    end
  end
end
