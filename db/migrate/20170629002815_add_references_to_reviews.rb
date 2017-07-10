class AddReferencesToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :hotel, foreign_key: true
  end
end
