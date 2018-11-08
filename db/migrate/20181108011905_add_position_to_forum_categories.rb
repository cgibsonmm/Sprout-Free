class AddPositionToForumCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_categories, :position, :integer
  end
end
