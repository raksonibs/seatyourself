class Orderidtoitems < ActiveRecord::Migration
  def change
  	add_column :items, :order_id, :integer
  end
end
