class Addresidtomoment < ActiveRecord::Migration
  def change
  	add_column :moments, :restaurant_id, :integer
  end
end
