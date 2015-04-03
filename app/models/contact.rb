class Contact < ActiveRecord::Base

	after_initialize :default_values
	def default_values
		self.email = "mailto:ucberkeleyfoodpantry@gmail.com"
		self.facebook = "http://facebook.com/ucberkeleyfoodpantry"
   	 	self.location = "Stiles Hall at 2400 Bancroft Way"
    	self.hours = "Monday: 12 - 3 pm"
    end

end
