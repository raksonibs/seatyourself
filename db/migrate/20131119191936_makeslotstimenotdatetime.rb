class Makeslotstimenotdatetime < ActiveRecord::Migration
  def change
  	remove_column :slots, :tick
  	add_column :slots, :tock, :integer
  end
end
