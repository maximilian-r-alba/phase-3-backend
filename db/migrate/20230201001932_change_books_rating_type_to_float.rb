class ChangeBooksRatingTypeToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :rating, :float
  end
end
