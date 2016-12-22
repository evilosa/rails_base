class FixWagonNumber < ActiveRecord::Migration[5.0]
  def change
    change_column :wagons, :number, :integer
  end
end
