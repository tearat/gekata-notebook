class AddBodyToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :body, :text, null: true
  end
end
