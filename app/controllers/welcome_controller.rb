class WelcomeController < ApplicationController
	def index
    @contact = Contact.first
    if Contact.first == nil
      @contact = Contact.create!({:email => 'fill me out!', :facebook => 'fill me out!', :location => 'fill me out!', :hours => "fill me out!"})
    end
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
