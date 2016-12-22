class RenameOrderColumnt < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :order, :position
  end
end
