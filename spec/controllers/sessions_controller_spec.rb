require_relative '../rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "should login a new user if password/username is correct" do
        let :credentials do
          { :userid => 'fakeUser', :password => 'pass123' }
        end

        let :user do
          FactoryGirl.create(:user, credentials)
        end

        it "successfully logins" do
          post 'create', {:session => credentials}
          expect(response).to have_http_status(:success)
        end
    end

    it "should render sessions#new if password/username is incorrect" do
      fakeUser = double(:userid => "fakeUser", :password => "pass123")
      post :create, {:session => {:userid => "fakeUser", :password => "pass12"}}
      expect(response).to render_template("sessions/new")
    end
  end


end
