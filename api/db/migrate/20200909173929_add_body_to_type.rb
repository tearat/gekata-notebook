class AddBodyToType < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :body, :text, null: true
  end
end
