class Addrigththingtocategory < ActiveRecord::Migration
  def change
  	add_column :categories, :text, :string
  end
end
