require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "logging into ucbfoodpantry" do
    it "should call the user method that checks to see if password matches username" do
      user = mock('user1')
      User.should_receive(:find).with('1').and_return(user)
    end
  end

end
