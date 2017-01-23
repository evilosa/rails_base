class AddDefaultValuesForSeats < ActiveRecord::Migration[5.0]
    def up
      change_column :wagons, :top_seats, :integer, :default => 0
      change_column :wagons, :bottom_seats, :integer, :default => 0
      change_column :wagons, :side_top_seats, :integer, :default => 0
      change_column :wagons, :side_bottom_seats, :integer, :default => 0
      change_column :wagons, :seats, :integer, :default => 0
    end

    def down
      change_column :wagons, :top_seats, :integer
      change_column :wagons, :bottom_seats, :integer
      change_column :wagons, :side_top_seats, :integer
      change_column :wagons, :side_bottom_seats, :integer
      change_column :wagons, :seats, :integer
    end
end
