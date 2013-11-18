class Addtimeslocationtablesizetorest < ActiveRecord::Migration
  def change
  	add_column :restaurants, :address, :string
  	add_column :restaurants, :opentime, :datetime
  	add_column :restaurants, :closetime, :datetime
  	add_column :restaurants, :tablesize, :integer
  end
end
