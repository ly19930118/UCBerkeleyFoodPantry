class Contact < ActiveRecord::Base
  def hours_format
  	if self.hours != nil
    	hours_list = self.hours.strip.split("\n")
    	hours_list.collect{|x| x.strip}
   	end
  end
end
