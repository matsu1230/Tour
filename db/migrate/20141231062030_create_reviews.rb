class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :member
      t.references :trip
      t.string :reviewtitle, null: false
      t.string :reviewcontent, null: false
      t.timestamps
    end
   add_index :reviews, :member_id
   add_index :reviews, :trip_id
  end
end
