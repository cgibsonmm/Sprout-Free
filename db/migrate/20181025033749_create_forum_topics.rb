class CreateForumTopic < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_topics do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
