class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :review

      t.timestamps
    end
  end
end
