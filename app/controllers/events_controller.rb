class EventsController < ApplicationController

  def index
    @past_events = Event.past
    @future_events = Event.future
    @today_events = Event.today
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "New event created!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in creating event - try again"
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event updated!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in updating event - try again"
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "Event deleted!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in deleting event - try again"
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:id, :name, :description, :date, :time,
                                    :location)
    end
end
