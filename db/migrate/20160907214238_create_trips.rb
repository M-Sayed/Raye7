class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :driver_id
      t.integer :source_id
      t.integer :destination_id
      t.integer :seats

      t.timestamps
    end
    add_index :trips, :driver_id
    add_index :trips, :source_id
    add_index :trips, :destination_id
  end
end
