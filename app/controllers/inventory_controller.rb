class InventoryController < ApplicationController
  def index
    if current_user
      @is_admin = current_user.admin
    else
      @is_admin = false
    end
    if params[:id] == nil
      @inventory_item = InventoryItem.new
    else
      @inventory_item = InventoryItem.find(params[:id])
    end
    #pull data from doc
    #i.val i.id i.name
    @items = InventoryItem.all
    #@items = [{:val => "1", :id => "id1", :name => "name1", :limit => 2}, {:val => "2", :id => "id2", :name => "name2", :limit => 1}]
    #@hours = Contact.first
    if params[:success]
    	redirect_to "https://www.surveymonkey.com"
    end


  end

  def order
    #check if order more than twice
    numItems = 0
    emailText = ""
    # check if valid value
    params[:items].each do |key, item|
      if item[:checked] == "1"
        if item.has_key?(:value)
          numCurrent = item[:value].to_i
        else
          numCurrent = 1
        end
        numItems = numItems + numCurrent
        #construct the email string
        emailText = emailText + item[:name] + " x " + numCurrent.to_s + "; \n"

      end
    end

    if not current_user
      flash[:notice] = "You must log in to checkout"
    elsif numItems > 4
      flash[:notice] = "You can only have 4 items total"
    else
      flash[:notice] = "Your order has been successfully processed."
    end

    #send email
    flash[:notice] = "email: " + emailText
    #redirect to survey
    redirect_to inventory_path(@inventory, :success => true)

  end


  def edit
    new_or_edit
  end

  def new_or_edit
    if params[:id] == nil or params[:id] == ""
      @inventory_item = InventoryItem.new
    else
      @inventory_item = InventoryItem.find(params[:id])
    end
    @inventory_item[:name] = params[:inventory_item][:name]
    @inventory_item[:stock] = params[:inventory_item][:stock]
    @inventory_item[:max_per_order] = params[:inventory_item][:max_per_order]
    @inventory_item.save

    flash[:notice] = "Information for #{@inventory_item.name} was successfully updated."
    redirect_to inventory_path 
  end

  def destroy
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.delete
    flash[:notice] = "#{@inventory_item.name} was deleted from the list."
    redirect_to inventory_path
  end


end
