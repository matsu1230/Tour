class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :fullname, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email
      t.string :name, null: false
      t.boolean :administrator, null: false, default: false
      t.timestamps
    end
  end
end
