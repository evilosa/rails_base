class WagonTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :type, :string
    add_column :wagons, :top_seats, :integer
    add_column :wagons, :bottom_seats, :integer
    add_column :wagons, :side_top_seats, :integer
    add_column :wagons, :side_bottom_seats, :integer
    add_column :wagons, :seats, :integer
    remove_column :wagons, :wagon_type, :string
  end
end
