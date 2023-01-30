class AddBookUrlToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :cover_url, :string
  end
end
