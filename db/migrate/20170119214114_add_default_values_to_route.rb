class AddDefaultValuesToRoute < ActiveRecord::Migration[5.0]
  def up
    change_column :railway_stations_routes, :arrival_time, :time, :default => Time.now
    change_column :railway_stations_routes, :departure_time, :time, :default => Time.now
    change_column :tickets, :train_id, :integer, null: false
    change_column :tickets, :user_id, :integer, null: false
    change_column :tickets, :start_station_id, :integer, null: false
    change_column :tickets, :end_station_id, :integer, null: false
  end

  def down
    change_column :railway_stations_routes, :arrival_time, :time, :default => nil
    change_column :railway_stations_routes, :departure_time, :time, :default => nil
    change_column :tickets, :train_id, :integer, null: true
    change_column :tickets, :user_id, :integer, null: true
    change_column :tickets, :start_station_id, :integer, null: true
    change_column :tickets, :end_station_id, :integer, null: true
  end
end
