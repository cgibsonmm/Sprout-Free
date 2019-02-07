class AddPostCountToForumThread < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :post_count, :integer, default: 1
  end
end
