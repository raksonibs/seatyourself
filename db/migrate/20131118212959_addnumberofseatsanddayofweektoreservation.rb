class Addnumberofseatsanddayofweektoreservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :numberofseats, :integer
  	add_column :reservations, :day, :text
  end
end
