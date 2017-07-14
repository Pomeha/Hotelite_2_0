class RemoveStatusFromHotels < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :status, :string
  end
end
