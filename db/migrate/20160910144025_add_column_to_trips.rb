class AddColumnToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :departure_time, :date
  end
end
