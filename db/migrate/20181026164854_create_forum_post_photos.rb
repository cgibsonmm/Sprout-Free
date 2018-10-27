class CreateForumPostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_post_photos do |t|
      t.text :image_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
