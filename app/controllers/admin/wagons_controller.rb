class Admin::WagonsController < Admin::BaseController
  before_action :set_train, only: [:create, :new]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to [:admin, @wagon], notice: 'Wagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end
end
