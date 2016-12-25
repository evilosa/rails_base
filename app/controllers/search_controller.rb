class SearchController < ApplicationController

  def index
  end

  def show
    stations = [secure_params[:first_station_id], secure_params[:last_station_id]].uniq
    @result = Search.find_route_trains(stations)
  end

  private

  def secure_params
    params.permit(:first_station_id, :last_station_id)
  end
end
