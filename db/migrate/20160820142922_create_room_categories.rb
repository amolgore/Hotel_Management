class CreateRoomCategories < ActiveRecord::Migration
  def change
    create_table :room_categories do |t|
      t.text :category
      t.float :price

      t.timestamps null: false
    end
  end
end
