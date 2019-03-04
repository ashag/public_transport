class AddDelays < ActiveRecord::Migration[5.2]
  def change
    create_table :delays do |t|
      t.integer :line_id
      t.integer :delay_in_minutes
      t.boolean :current, default: true

      t.timestamp
    end
  end
end
