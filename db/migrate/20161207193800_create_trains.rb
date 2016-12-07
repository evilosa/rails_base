class CreateTrains < ActiveRecord::Migration[5.0]
  def change
    create_table :trains do |t|

      t.timestamps
    end
  end
end
