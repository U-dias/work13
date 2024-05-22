class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :r_name
      t.binary :r_photo
      t.text :r_self
      t.bigint :r_price
      t.date :r_create
      t.string :r_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
