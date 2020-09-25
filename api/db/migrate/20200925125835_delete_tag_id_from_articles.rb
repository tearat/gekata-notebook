class DeleteTagIdFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :tag_id
  end
end
