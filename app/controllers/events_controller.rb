class EventsController < ApplicationController
  def index
    @event = Event.new

  end

  def create
    @event = params[:event]
    @event.save

    redirect_to :index
  end

  def remove

  end

  def edit

  end

  def list

  end

end
