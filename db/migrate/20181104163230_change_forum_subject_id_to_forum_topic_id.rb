class ChangeForumSubjectIdToForumTopicId < ActiveRecord::Migration[5.2]
  def change
    rename_column :forum_Threads, :forum_subject_id, :forum_topic_id
  end
end
