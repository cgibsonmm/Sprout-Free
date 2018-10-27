class CreateForumSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_subjects do |t|
      t.string :subject_name

      t.timestamps
    end
  end
end
