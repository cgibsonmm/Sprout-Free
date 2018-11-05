class AddForumTopicToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :forum_topic_id, :integer
  end
end
