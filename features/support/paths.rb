# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
  	case page_name
	  	when /^the (UCBerkeleyFoodPantry )?home\s?page$/ then '/welcome/index'
		  when /^the "About Page"/ then '/about'
		  when /^the "Resources Page"/ then '/resources'
		  when /^the "Inventory Page"/ then '/inventory'
		  when /^the "Events Page"/ then '/events'
      when /^the login page/ then '/login'
     when /^the "Edit Contact Page"/ then '/contact/edit'
	  end
  end
end

World(NavigationHelpers)
