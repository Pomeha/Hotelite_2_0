class AddRateToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :rate, :integer
  end
end
