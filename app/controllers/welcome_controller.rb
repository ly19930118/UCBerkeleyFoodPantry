class WelcomeController < ApplicationController
	def index
		if current_user
			@is_admin = current_user.admin
		else
			@is_admin = false
		end
    if Contact.first == nil
      @contact = Contact.create!({:email => 'fill me out!', :facebook => 'fill me out!', :location => 'fill me out!', :hours => "fill me out!"})
    else
    	@contact = Contact.first
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
