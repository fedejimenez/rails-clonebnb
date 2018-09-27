class AddMoreColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :verification, :boolean
    add_column :users, :role, :integer, default: 0
    add_column :users, :avatar, :string
  end
end
