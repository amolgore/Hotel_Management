class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :number
      t.references :room_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
