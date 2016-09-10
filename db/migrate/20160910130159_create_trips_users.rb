class CreateTripsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :trips_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
    end
  end
end
