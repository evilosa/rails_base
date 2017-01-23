class RemoteTotalSeatsField < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagons, :total_seats, :integer
  end
end
