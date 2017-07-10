class RemovePhotopathFromHotels < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :photopath, :string
  end
end
