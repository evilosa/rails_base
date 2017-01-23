class AddAdminField < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :second_name, :string, default: ''
    add_column :users, :last_name, :string, default: ''
  end
end
