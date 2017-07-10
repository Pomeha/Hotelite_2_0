class AddRoomToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :room, :text
  end
end
