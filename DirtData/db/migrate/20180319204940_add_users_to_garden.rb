class AddUsersToGarden < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :garden_name, :string
    add_index :users, :garden_name
  end
end
