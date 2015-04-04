require 'rails_helper'
require 'spec_helper'

RSpec.describe PagesController do
    render_views

    describe "GET about" do
        it "renders the about template" do
            get :about
            expect(response).to render_template("about")
            expect(response.body).to match /About Us/im
        end
    end
    describe "GET inventory" do
        it "renders the inventory template" do
            get :inventory
            expect(response).to render_template("inventory")
            expect(response.body).to match /Inventory Form/im
        end
    end
    describe "GET resources" do
        it "renders the resources template" do
            get :resources
            expect(response).to render_template("resources")
            expect(response.body).to match /Resources/im
        end
    end
end

