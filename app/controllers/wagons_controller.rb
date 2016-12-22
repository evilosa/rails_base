class WagonsController < ApplicationController
  before_action :set_train, only: [:index, :create, :new]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  # GET /wagons
  def index
    @wagons = type_class.all
  end

  # GET /wagons/1
  def show
  end

  # GET /wagons/new
  def new
    @wagon = type_class.new
  end

  # GET /wagons/1/edit
  def edit
  end

  # POST /wagons
  def create
    # @wagon = type_class.new(wagon_params)
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to @train
    else
      render :new
    end
  end

  # PATCH/PUT /wagons/1
  def update
    @wagon.calculate_total_seats
    if @wagon.update(wagon_params)
      redirect_to @wagon, notice: 'Wagon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wagons/1
  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private

  def type
    @type ||= Wagon::TYPES.include?(params[:type]) ? params[:type] : 'Wagon'
  end

  def type_class
    type.constantize
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Use callbacks to share common setup or conswagonts between actions.
  def set_wagon
    @wagon = type_class.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wagon_params
    params.require(type.underscore.to_sym).permit(:number, :type, :train_id, :total_seats, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end
end
