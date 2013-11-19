class Dayidtoslot < ActiveRecord::Migration
  def change
  	add_column :slots, :moment_id, :integer
  end
end
