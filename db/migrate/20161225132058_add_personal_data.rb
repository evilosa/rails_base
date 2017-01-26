class AddPersonalData < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :document_series, :string
    add_column :tickets, :document_number, :string
    add_column :tickets, :first_name, :string
    add_column :tickets, :second_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :birth_day, :string
  end
end
