class AddForeignKeyToArticles < ActiveRecord::Migration[5.2]
  # hmm not working in sqlite3
  def change
    add_foreign_key :articles, :users
  end
end
