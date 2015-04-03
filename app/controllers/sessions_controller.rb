class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(userid: params[:session][:userid])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      flash[:success] = 'Successful Login'
      redirect_to root_path
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid user/password combination'
      render 'new'
    end
  end
  def destroy
  end
end
