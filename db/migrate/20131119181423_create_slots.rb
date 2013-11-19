class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.datetime :tick
      t.integer :seats

      t.timestamps
    end
  end
end
