class Itemidtoorder < ActiveRecord::Migration
  def change
  	add_column :items, :item_id, :integer
  end
end
