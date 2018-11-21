class AddSlugToForumTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_topics, :slug, :string
    add_index :forum_topics, :slug, unique: true
  end
end
