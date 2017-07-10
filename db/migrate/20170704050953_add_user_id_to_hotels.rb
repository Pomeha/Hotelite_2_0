class AddUserIdToHotels < ActiveRecord::Migration[5.1]
  def change
      add_reference :hotels, :user, index: true
  end
end
