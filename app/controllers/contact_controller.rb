class ContactController < ApplicationController

	def index
		@contact = Contact.create(email: "mailto:ucberkeleyfoodpantry@gmail.com",
      facebook: "http://facebook.com/ucberkeleyfoodpantry",
      location: "Stiles Hall at 2400 Bancroft Way",
      hours: "Monday: 12 - 3pm")
  end

  def edit
    @contact = Contact.create params[:id]
  end

  def update
  	@contact = Contact.find(params[:id])
  	@contact.update_attributes!(params[:contact])
  	flash[:notice] = "Contact information was successfully updated"
  	redirect_to '/contact'
  end

end