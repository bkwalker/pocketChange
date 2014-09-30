class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :location_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
