require_relative '../rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should render the #new view" do
    	get :new
    	expect(response).to render_template :new
    end
  end

  describe "POST create" do
  	context "with valid attributes" do
  		it "creates a new user" do
  			expect{
  				post :create, user: FactoryGirl.attributes_for(:user)
  			}.to change(User, :count).by(1)
  		end

  		it "redirects to home" do
  			post :create, user: FactoryGirl.attributes_for(:user)
  			expect(response).to redirect_to root_path
  		end
  	end
  end

end

