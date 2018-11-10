class AddDescriptionToForumTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_topics, :description, :text
  end
end
