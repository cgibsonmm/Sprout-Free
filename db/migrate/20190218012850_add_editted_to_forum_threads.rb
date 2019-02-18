class AddEdittedToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :editted, :boolean, default: false
  end
end
