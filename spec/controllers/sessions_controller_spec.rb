require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "should create a new user if password/username is correct" do
      get :create
      expect(response).to have_http_status(:success)
    end
    it "should render get #new if password/username is incorrect" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end


end
