class AddPositionToForumSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_subjects, :position, :integer
  end
end
