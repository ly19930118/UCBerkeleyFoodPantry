
class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    startDate = DateTime.new(params[:event]["start_date(1i)"].to_i, 
                        params[:event]["start_date(2i)"].to_i,
                        params[:event]["start_date(3i)"].to_i,
                        params[:event]["start_date(4i)"].to_i,
                        params[:event]["start_date(5i)"].to_i)
    endDate = DateTime.new(params[:event]["end_date(1i)"].to_i, 
                        params[:event]["end_date(2i)"].to_i,
                        params[:event]["end_date(3i)"].to_i,
                        params[:event]["end_date(4i)"].to_i,
                        params[:event]["end_date(5i)"].to_i)
    @event = Event.create!(:title => params[:event][:title],
                        :description => params[:event][:description], 
                        :start_date => startDate,
                        :end_date => endDate)
    @event.save!
    flash[:notice] = "#{@event.title} was successfully created."
    redirect_to events_path
  end

  def remove

  end

  def edit

  end

  def list

  end

end
