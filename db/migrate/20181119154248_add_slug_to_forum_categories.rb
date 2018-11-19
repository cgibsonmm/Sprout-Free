class AddSlugToForumCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_categories, :slug, :string
    add_index :forum_categories, :slug, unique: true
  end
end
