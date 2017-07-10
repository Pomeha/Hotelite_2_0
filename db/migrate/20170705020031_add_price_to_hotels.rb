class AddPriceToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :price, :integer
  end
end
