class Removespecialorder < ActiveRecord::Migration
  def change
  	remove_column :orders, :specialnotes
  end
end
