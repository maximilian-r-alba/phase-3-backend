class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.string :author
      t.integer :rating
    end
  end
end
