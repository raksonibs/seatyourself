class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product
      t.integer :price
      t.string :desc

      t.timestamps
    end
  end
end
