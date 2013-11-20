class Removequantitytoorder < ActiveRecord::Migration
  def change
  	remove_column :orders, :quantity
  	add_column :items, :quantity, :integer
  end
end
