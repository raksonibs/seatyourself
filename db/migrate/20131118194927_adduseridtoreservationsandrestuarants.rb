class Adduseridtoreservationsandrestuarants < ActiveRecord::Migration
  def change
  	add_column :reservations, :restaurant_id, :integer
  	add_column :reservations, :user_id, :integer
  end
end
