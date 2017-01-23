class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @ticket = if params.include?(:ticket)
                Ticket.new(ticket_params)
              else
                Ticket.new
              end
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end



  def destroy
    @ticket.destroy if @ticket.user == current_user
    redirect_to tickets_url
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number, :train_id, :start_station_id, :end_station_id, :document_series, :document_number, :last_name, :first_name, :second_name)
  end

end