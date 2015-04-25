class InventoryController < ApplicationController
  def index
    #pull data from doc
    #i.val i.id i.name
    @items = InventoryItem.all
    #@items = [{:val => "1", :id => "id1", :name => "name1", :limit => 2}, {:val => "2", :id => "id2", :name => "name2", :limit => 1}]
    #@hours = Contact.first




  end

  def order
    #check if order more than twice
    numItems = 0
    emailText = ""
    # check if valid value
    params[:items].each do |item|
      if item[:checked] == "1"
        if item.has_key?(:value)
          numItems = numItems + item[:value]
        else
          numItems = numItems + 1
        end
        #construct the email string
        #emailText = item[:]

      end

    end

    #send email

    #redirect to survey
    redirect_to :index

  end

end