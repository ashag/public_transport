class AddStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.integer :sid
      t.integer :x_coord
      t.integer :y_coord
      t.integer :quadrant

      t.timestamps
    end
  end
end
