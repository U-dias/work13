class RemoveRphotoFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :r_photo, :binary
  end
end
