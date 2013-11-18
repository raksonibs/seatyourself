class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :string	

      t.timestamps
    end
  end
end
