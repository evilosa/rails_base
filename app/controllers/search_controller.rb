class SearchController < ApplicationController

  def index
    @stations = RailwayStation.all
  end

  def show
    @result = Search.find_route_trains(secure_params)
  end

  private

  def secure_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end
