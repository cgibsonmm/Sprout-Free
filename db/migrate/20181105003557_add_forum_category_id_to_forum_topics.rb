class AddForumCategoryIdToForumTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_topics, :forum_category_id, :integer
    add_column :forum_topics, :user_id, :integer
  end
end
