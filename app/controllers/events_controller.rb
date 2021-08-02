class EventsController < ApplicationController

  def index
  end

  def create
    @event = current_user.created_events.build(creator_id: params[:id])
  end
end
