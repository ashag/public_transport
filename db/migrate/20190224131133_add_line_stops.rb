class AddLineStops < ActiveRecord::Migration[5.2]
  def change
    create_table :line_stops do |t|
      t.integer :line_id
      t.integer :stop_id

      t.timestamps
    end
  end
end
