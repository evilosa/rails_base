class AddRailwayStationTitle < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations, :title, :string
  end
end
