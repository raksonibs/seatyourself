class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :date
      t.integer :seats

      t.timestamps
    end
  end
end
