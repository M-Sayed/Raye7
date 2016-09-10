class AddingIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :places, :name 
    add_index :groups, :name
    add_index :users, :group_id
    add_index :users, :home_place_id
    add_index :users, :work_place_id
  end
end
