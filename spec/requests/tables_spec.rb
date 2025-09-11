require 'rails_helper'

RSpec.describe "Tables", type: :request do 
  let(:user) { create(:user) }
  before { log_in(user) }

  describe "POST /tables" do 
    it "creates a table" do 
      expect {
        post "/tables", params: { table: attributes_for(:table) }
      }.to change(user.tables, :count).by(1)

      expect(response).to redirect_to("/tables")
      follow_redirect!
      expect(flash[:notice]).to eq("Table added!")
    end

    it "renders new on invalid params" do 
      post "/tables", params: { table: { name: "", seat_capacity: nil } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq("Error creating table")
    end
  end
end
