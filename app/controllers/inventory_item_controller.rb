class InventoryController < ApplicationController
  def index
    #pull data from doc
    #i.val i.id i.name
    @items = [{:val => "1", :id => "id1", :name => "name1"},{:val => "2", :id => "id2", :name => "name2"}]
    #@hours = Contact.first
    
    


  end

  def create

    # check if valid value


    #send email

    #redirect to survey

  end

end