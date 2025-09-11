require 'rails_helper' 

RSpec.describe "Users", type: :request do 
  describe "POST /users" do 
    it "creates a new user with valid params" do 
      expect {
        post users_path, params: { user: { username: "bob", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(flash[:notice]).to include("Account created!")
    end

    it "renders new when invalid" do 
      expect {
        post users_path, params: { user: { username: "", password: "password", password_confirmation: "nope" } }
      }.not_to change(User, :count)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("error")
    end
  end
end
