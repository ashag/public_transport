class AddRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.integer :line_id
      t.integer :stop_id
      t.time :arrival_time
      t.time :departure_time
      t.boolean :current, default: true
      t.integer :stop_number
      t.index :stop_id
      t.index :current
      t.index :arrival_time

      t.timestamps
    end
  end
end
