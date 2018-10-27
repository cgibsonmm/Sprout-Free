class AddForumSubjectToForumThread < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :forum_subject_id, :integer
  end
end
