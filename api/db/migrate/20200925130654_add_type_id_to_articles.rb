class AddTypeIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :type_id, :integer, null: false
  end
end
