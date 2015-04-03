class ContactController < ApplicationController
	@@email = "mailto:ucberkeleyfoodpantry@gmail.com"
	@@facebook = "http://facebook.com/ucberkeleyfoodpantry"
	@@location = "Stiles Hall at 2400 Bancroft Way"
	@@hours = "Monday: 12 - 3 pm"

	def index
		@contact = Contact.new 
  	end

  	def edit
  		
  	end

  	def update
  		@contact = Contact.find(params[:id])
  		@contact.update_attributes!(params[:contact])
  		flash[:notice] = "Contact information was successfully updated"
  		redirect_to '/contact'
  	end

end