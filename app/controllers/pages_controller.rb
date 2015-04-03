class PagesController < ApplicationController
  def about
  end
  def events
  end
  def inventory
  end
  def resources
  end
  def contact
  end
  def login
  end
  def contact_edit
  end
  def contact_update
    redirect_to contact_path
  end
end
