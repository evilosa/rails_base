class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
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

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  def buy
    @ticket = Ticket.new(ticket_params)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number, :user_id, :train_id, :start_station_id, :end_station_id, :document_series, :document_number, :last_name, :first_name, :second_name)
  end

end