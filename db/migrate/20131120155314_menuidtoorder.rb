class Menuidtoorder < ActiveRecord::Migration
  def change
  	add_column :orders, :menu_id, :integer
  end
end
