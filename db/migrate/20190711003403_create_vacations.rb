class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :location_name
      t.text :description
      t.string :best_time
      t.string :reason
      t.string :photo_link
      t.timestamps null: false
    end
  end
end
