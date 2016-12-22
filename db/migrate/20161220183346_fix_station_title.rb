class FixStationTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations, :title, :name
  end
end
