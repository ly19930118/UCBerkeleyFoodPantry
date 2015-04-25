class InventoryController < ApplicationController
  def index
    #pull data from doc
    #i.val i.id i.name
    @items = [{:val => "1", :id => "id1", :name => "name1", :limit => 2}, {:val => "2", :id => "id2", :name => "name2", :limit => 1}]
    #@hours = Contact.first




  end

  def create
    #check if order more than twice

    # check if valid value


    #send email

    #redirect to survey
    redirect_to :index

  end

end