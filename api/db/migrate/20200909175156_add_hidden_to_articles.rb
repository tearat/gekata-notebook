class AddHiddenToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :hidden, :integer, default: 0
  end
end
