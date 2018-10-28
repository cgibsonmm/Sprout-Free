class AddPhotoToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :photo_file, :text
  end
end
