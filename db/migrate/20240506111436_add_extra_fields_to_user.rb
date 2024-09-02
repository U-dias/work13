class AddExtraFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :binary
  end
end
