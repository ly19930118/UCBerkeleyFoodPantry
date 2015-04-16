class WelcomeController < ApplicationController
	def index
		@contact = Contact.first
  end

  def edit
    @contact = Contact.first
  end

  def update
    @contact = Contact.first
  	@contact.update_attributes!(params.require(:contact).permit(:email, :facebook, :location, :hours))
  	flash[:notice] = "Contact information was successfully updated"
  	redirect_to root_path
  end
end
