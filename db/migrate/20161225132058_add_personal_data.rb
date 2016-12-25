class AddPersonalData < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_infos do |t|
      t.references :ticket
      t.string :number
      t.string :series
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :birth_day
      t.timestamps
    end
  end
end
