class Makeslotstimetimenotinteger < ActiveRecord::Migration
  def change
  	remove_column :slots, :tock
  	add_column :slots, :tock, :time
  end
end
