require 'rails_helper'
require 'pp'
RSpec.describe EventsController, type: :controller do
  render_views
  describe "GET index" do

    it "returns all events" do
      
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")
      e1 = Event.create!(:title => "123", :start_date => DateTime.new(2001, 1, 2, 3), :end_date => DateTime.now, :description => "hello")
      get :index
      #allow(Event).to receive_message_chain(:all, :where) {[e1, e2]}
      #p Event.all.where('start_date > ?', 3.months.ago)
      #p assigns(:events)
      #assigns(:events).should eq(1)
      #expect(:events.size).to eq(2)
      expect(response.body).to match(/abc/)
      expect(response.body).not_to match(/123/)
      #response.body.should not =~ /hihi/
    end

    it "returns the current event" do
      get :index
      expect(assigns(:event).title).to be(nil)
      expect(assigns(:event).description).to be(nil)
    end

    it "returns the current event with proper data" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")
      get :index, :id => e1.id
      expect(assigns(:event).title).to eq("abc")
    end
  end

  describe "POST edit" do
    it "updates the new object" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")
      allow(Event).to receive(:new){e1}
      allow(DateTime).to receive(:new){DateTime.now}

      post :edit, :event => {:title => "hi", :description => "update"}
      #, "start_date(1i)" => "00", "start_date(2i)" => "00", "start_date(3i)" => "00", "start_date(4i)" => "00", "start_date(5i)" => "00"

      expect(assigns(:event).title).to eq("hi")
      expect(assigns(:event).description).to eq("update")
    end

    it "updates the existing object" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")
      
      allow(DateTime).to receive(:new){DateTime.now}

      post :edit, :id => e1.id, :event => {:title => "hi", :description => "update"}

      expect(assigns(:event).title).to eq("hi")
      expect(assigns(:event).description).to eq("update")


    end

    it "redirect to events page" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")
      
      allow(DateTime).to receive(:new){DateTime.now}

      post :edit, :id => e1.id, :event => {:title => "hi", :description => "update"}

      expect(response).to redirect_to events_path

    end

  end

  describe "POST delete" do
    it "delete the existing object" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")

      post :destory, :id => e1.id

      expect{Event.find(e1.id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it "redirect to events page" do
      e1 = Event.create!(:title => "abc", :start_date => DateTime.now, :end_date => DateTime.now, :description => "hello")

      post :destory, :id => e1.id

      expect(response).to redirect_to events_path

    end

  end

end
