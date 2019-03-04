class AddLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.integer :lid
      t.string  :line_name

      t.timestamps
    end
  end
end
