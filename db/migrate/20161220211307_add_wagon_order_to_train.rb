class AddWagonOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :wagon_order, :boolean
  end
end
