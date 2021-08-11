class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "New event created!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in creating event"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:id, :name, :description, :date, :time,
                                    :location)
    end
end
