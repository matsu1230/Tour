class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :trip, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.integer :price, null: false
      t.integer :limit, null: false
      t.integer :lowst, null: false
      t.timestamps
    end
    add_index :details, :trip_id
  end
end
