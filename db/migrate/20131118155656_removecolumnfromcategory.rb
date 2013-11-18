class Removecolumnfromcategory < ActiveRecord::Migration
  def change
  	remove_column :categories, :string
  end
end
