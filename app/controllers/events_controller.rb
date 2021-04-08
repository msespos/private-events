class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @created_event = current_user.created_events.build(event_params)
    if @created_event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:description, :creator_id)
  end
end