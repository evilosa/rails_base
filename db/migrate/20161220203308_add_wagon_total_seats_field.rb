class AddWagonTotalSeatsField < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :total_seats, :integer
  end
end
