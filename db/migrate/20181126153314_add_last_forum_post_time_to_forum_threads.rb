class AddLastForumPostTimeToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :last_forum_post_time, :datetime
  end
end
