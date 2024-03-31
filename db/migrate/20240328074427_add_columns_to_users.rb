class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, default: "", null: false
    add_column :users, :role, :integer, default: 0
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :location, :text
  end
end
