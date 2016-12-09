class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.0]
  def change
    # add_column :trains, :railway_station_id, :integer
    add_belongs_to :trains, :current_station
  end
end
