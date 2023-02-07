class RenameBooksGenreToFictionBoolean < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :genre, :fiction?
    change_column :books, :fiction?, :boolean
  end
end
