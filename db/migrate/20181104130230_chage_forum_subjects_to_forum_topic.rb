class ChageForumSubjectsToForumTopic < ActiveRecord::Migration[5.2]
  def change
    rename_column :forum_subjects, :title, :title
    rename_table :forum_subjects, :forum_topics
  end
end
