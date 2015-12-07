class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :member, null: false
      t.references :detail, null: false
      t.integer :people
      t.string :food
      t.boolean :canceld, default: false 
      t.timestamps
    end
    add_index :reservations, :member_id
    add_index :reservations, :detail_id
  end
end
