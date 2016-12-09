class CreateTicket < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :number
    end
  end
end
