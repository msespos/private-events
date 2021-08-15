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

  def update
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:id, :name, :description, :date, :time,
                                    :location)
    end
end
