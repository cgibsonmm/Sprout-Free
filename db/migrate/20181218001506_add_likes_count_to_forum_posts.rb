class AddLikesCountToForumPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_posts, :likes_count, :integer
  end
end
