class Contact < ActiveRecord::Base
  def hours_format
    hours_list = self.hours.strip.split("\n")
    hours_list.collect{|x| x.strip}
  end
end
