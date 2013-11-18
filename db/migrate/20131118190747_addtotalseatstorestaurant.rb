class Addtotalseatstorestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants, :totalsize, :integer
  end
end
