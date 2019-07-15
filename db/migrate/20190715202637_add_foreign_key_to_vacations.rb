class AddForeignKeyToVacations < ActiveRecord::Migration
  def change
    add_column :vacations, :user_id, :integer      
    end
end
