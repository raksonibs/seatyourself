class Ratingstorestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :rating, :integer
  	add_column :restaurants, :raters, :integer
  end
end
