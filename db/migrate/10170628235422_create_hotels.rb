class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :star
      t.boolean :breakfest
      t.string :address
      t.string :photopath

      t.timestamps
    end
  end
end
