require 'rails_helper'
RSpec.describe InventoryController, type: :controller do
  render_views
  describe "GET index" do

    it "returns all items" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)
        i2 = InventoryItem.create!(:name => "food2", :stock => 40, :max_per_order => 1)
        get :index

        expect(response.body).to match(/food1/)
        expect(response.body).to match(/food2/)

    end
    it "sets the inventory item" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)
        allow(InventoryItem).to receive(:find) {i1}

        get :index, :id => i1.id
        expect(assigns(:display_edit)).to eq(true)
        expect(assigns(:inventory_item).name).to eq("food1")
    end
    it "sets the default new item" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)

        allow(InventoryItem).to receive(:new) {i1}

        get :index
        expect(assigns(:display_edit)).to eq(false)
        expect(assigns(:inventory_item).name).to eq("food1")
    end
  end

  describe "POST order" do
    it "process the item list" do
        post :order, :items => { 1 => {:checked => "1", :value => "2", :name => "food1"}, 2 => {:checked => "1", :name => "food2"}, 3 => {:checked => "0", :name => "not_food"}}
        expect(assigns(:itemList)).to eq([{:name => "food1", :amount => 2}, {:name => "food2", :amount => 1}])
    end
    it "checks logged in" do
        post :order, :items => { 1 => {:checked => "1", :value => "2", :name => "food1"}, 2 => {:checked => "1", :name => "food2"}, 3 => {:checked => "0", :name => "not_food"},7 => {:checked => "1", :value => "2", :name => "food5"},4 => {:checked => "1", :value => "2", :name => "food123"},5 => {:checked => "1", :value => "2", :name => "food13333"},6 => {:checked => "1", :value => "2", :name => "food22221"}}
        expect(flash[:notice]).to eq("You must log in to checkout")
    end

    it "checks the order is processed" do
        post :order, :items => { 1 => {:checked => "1", :value => "2", :name => "food1"}, 2 => {:checked => "1", :name => "food2"}, 3 => {:checked => "0", :name => "not_food"}}
        expect(response.body).to match(/redirected/)
    end
  end

  describe "POST edit" do
    it "has new inventory item" do
        
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)

        allow(InventoryItem).to receive(:new) {i1}
        post :edit, :inventory_item => {:name => "updatedFoodName", :stock => 20, :max_per_order => 1}
        expect(assigns(:inventory_item).id).to eq(i1.id)

    end

    it "has existing inventory item" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)
        
        post :edit, :id => i1.id, :inventory_item => {:name => "updatedFoodName", :stock => 20, :max_per_order => 1}
        expect(assigns(:inventory_item).id).to eq(i1.id)

    end

    it "has all the items saved" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)
        post :edit, :id => i1.id, :inventory_item => {:name => "updatedFoodName", :stock => 20, :max_per_order => 1}


        expect(assigns(:inventory_item)[:name]).to eq("updatedFoodName")
        expect(assigns(:inventory_item)[:stock]).to eq(20)
        expect(assigns(:inventory_item)[:max_per_order]).to eq(1)
    end
  end

  describe "POST destroy" do
    it "deletes the item" do
        i1 = InventoryItem.create!(:name => "food1", :stock => 30, :max_per_order => 2)

        post :destroy, :id => i1.id

        expect{InventoryItem.find(i1.id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
