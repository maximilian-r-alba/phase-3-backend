class AlterBooksGenre < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :genre, :subgenre
    add_column :books, :genre, :string
  end
end
