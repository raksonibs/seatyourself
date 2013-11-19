class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :season
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
