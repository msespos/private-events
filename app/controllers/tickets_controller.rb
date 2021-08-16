class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      flash[:success] = "New ticket created!"
      redirect_to events_path
    else
      flash.now[:error] = "Error in creating ticket"
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
      params.require(:ticket).permit(:attended_event_id)
    end
end
