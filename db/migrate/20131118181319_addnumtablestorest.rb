class Addnumtablestorest < ActiveRecord::Migration
  def change
  	add_column :restaurants, :tables, :integer
  end
end
