class AddTrainNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :number, :string
  end
end
