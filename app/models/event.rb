require 'date'
class Event < ActiveRecord::Base
  #attr_accessible :title, :description, :start_date, :end_date
  def getStart
    self.start_date.to_f * 1000
  end

  def getEnd
    self.end_date.to_f * 1000
  end


end