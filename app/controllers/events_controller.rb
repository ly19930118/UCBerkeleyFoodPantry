
class EventsController < ApplicationController
  def index
    if current_user
      @is_admin = current_user.admin
    else
      @is_admin = false
    end

    if params[:id] == nil
      @event = Event.new
    else
      @event = Event.find(params[:id])
    end

    @events = Event.all.where('start_date > ?', 3.months.ago)
  end


  def edit
    new_or_edit
  end

  def new_or_edit

    if params[:id] == nil or params[:id] == ""
      @event = Event.new
    else
      @event = Event.find(params[:id])
    end
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
    @event[:title] = params[:event][:title]
    @event[:description] = params[:event][:description]
    @event[:start_date] = startDate
    @event[:end_date] = endDate
    @event.save

    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to events_path 
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    flash[:notice] = "#{@event.title} was deleted."
    redirect_to events_path
  end


end
