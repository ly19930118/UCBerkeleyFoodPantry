require 'rails_helper'

RSpec.describe PagesController do
    describe "GET about" do
        it "renders the about template" do
            get :about
            expect(response).to render_template("about")
        end
    end
    describe "GET events" do
        it "renders the about template" do
            get :events
            expect(response).to render_template("events")
        end
    end
    describe "GET inventory" do
        it "renders the inventory template" do
            get :inventory
            expect(response).to render_template("inventory")
        end
    end
    describe "GET resources" do
        it "renders the resources template" do
            get :resources
            expect(response).to render_template("resources")
        end
    end
end

