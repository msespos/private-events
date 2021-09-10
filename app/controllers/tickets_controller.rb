class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:success] = "New ticket created!"
    else
      flash[:error] = "Error in creating ticket: #{@ticket.errors.full_messages} "
    end
    redirect_to user_path(current_user.id)
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:success] = "Ticket updated!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in updating ticket"
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy
      flash[:success] = "Reservation canceled!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in canceling reservation - try again"
      render :new
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:attended_event_id, :attendee_id, :attending)
    end
end
