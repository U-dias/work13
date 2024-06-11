class AddPeopleToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :people, :bigint
  end
end
