class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :group_id
      t.integer :home_place_id
      t.integer :work_place_id

      t.timestamps
    end
  end
end
