require 'rails_helper'

RSpec.describe "Sessions", type: :request do 
  let(:user) { create(:user) } 

  describe "POST /login" do 
    it "logs in with valid credentials" do 
      post "/login", params: { username: user.username, password: "password123" }

      expect(sessions[:user_id]).to eq(user_id)
      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(flash[:notice]).to eq("Logged in!")
    end

    it "renders new on invalid login" do 
      post "/login", params: {username: user.username, password: "wrong" }

      expect(session[:user_id]).to be_nil 
      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq("Invalid username or password")
    end
  end
end
