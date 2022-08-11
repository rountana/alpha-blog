class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    # :articles -> name of the table
    add_column :articles, :user_id, :int
  end
end
