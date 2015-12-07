class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :tourname, null: false
      t.string :tourcontent, null: false
      t.string :category, null: false
      t.string :subcategory
      t.timestamps
    end
  end
end
